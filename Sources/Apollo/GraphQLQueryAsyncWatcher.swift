import Foundation

protocol GraphQLQueryWatcherProtocol: AnyObject {
  func refetch(cachePolicy: CachePolicy)
  func cancel()
}

@available(iOS 15.0, macOS 12.0, *)
public class GraphQLQueryAsyncWatcher<Query: GraphQLQuery>: AsyncSequence, GraphQLQueryWatcherProtocol {

  public typealias AsyncIterator = AsyncThrowingStream<GraphQLResult<Query.Data>, Error>.Iterator
  public typealias Element = AsyncThrowingStream<GraphQLResult<Query.Data>, Error>.Element

  let query: Query
  var stream: AsyncThrowingStream<GraphQLResult<Query.Data>, Error>!
  var continuation: AsyncThrowingStream<GraphQLResult<Query.Data>, Error>
    .Continuation!
  var watcher: GraphQLQueryWatcher<Query>!

  init(
    client: ApolloClientProtocol,
    query: Query,
    cachePolicy: CachePolicy = .default,
    callbackQueue: DispatchQueue = .main
  ) {
    self.query = query

    self.stream = AsyncThrowingStream { continuation in
      self.continuation = continuation
    }

    let watcher = GraphQLQueryWatcher(
      client: client,
      query: query,
      callbackQueue: callbackQueue
    ) { [continuation] result in
      continuation?.yield(with: result)
    }

    self.watcher = watcher

    continuation.onTermination = { @Sendable _ in watcher.cancel() }
  }

  public func makeAsyncIterator() -> AsyncThrowingStream<GraphQLResult<Query.Data>, Error>.Iterator {
    stream.makeAsyncIterator()
  }

  public func refetch(cachePolicy: CachePolicy = .fetchIgnoringCacheData) {
    watcher.refetch(cachePolicy: cachePolicy)
  }

  public func cancel() {
    continuation.finish(throwing: nil)
  }
}
