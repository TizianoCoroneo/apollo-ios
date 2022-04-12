import Foundation

/// A cache policy that specifies whether results should be fetched from the server or loaded from the local cache, but not both. This is used to ensure that you can safely use the async `ApolloClient.fetch` method, returning only one value. If you want to return values from both cache and the server, use `ApolloClient.fetchCacheAndData` instead.
public enum SingleValueCachePolicy {
  /// Return data from the cache if available, else fetch results from the server.
  case returnCacheDataElseFetch
  ///  Always fetch results from the server.
  case fetchIgnoringCacheData
  ///  Always fetch results from the server, and don't store these in the cache.
  case fetchIgnoringCacheCompletely
  /// Return data from the cache if available, else return nil.
  case returnCacheDataDontFetch

  /// The current default cache policy.
  public static var `default` = SingleValueCachePolicy(from: CachePolicy.default) ?? .returnCacheDataElseFetch

  init?(from cachePolicy: CachePolicy) {
    switch cachePolicy {
    case .returnCacheDataElseFetch: self = .returnCacheDataElseFetch
    case .fetchIgnoringCacheData: self = .fetchIgnoringCacheData
    case .fetchIgnoringCacheCompletely: self = .fetchIgnoringCacheCompletely
    case .returnCacheDataDontFetch: self = .returnCacheDataDontFetch
    case .returnCacheDataAndFetch: return nil
    }
  }

  var toCachePolicy: CachePolicy {
    switch self {
    case .returnCacheDataElseFetch: return .returnCacheDataElseFetch
    case .fetchIgnoringCacheData: return .fetchIgnoringCacheData
    case .fetchIgnoringCacheCompletely: return .fetchIgnoringCacheCompletely
    case .returnCacheDataDontFetch: return .returnCacheDataDontFetch
    }
  }
}

@available(iOS 15.0, macOS 12.0, *)
public extension ApolloClient {

  func clearCache(
    callbackQueue: DispatchQueue = .main
  ) async throws {
    try await withCheckedThrowingContinuation { continuation in
      self.clearCache(
        callbackQueue: callbackQueue
      ) { result in
        continuation.resume(with: result)
      }
    }
  }

  func fetch<Query: GraphQLQuery>(
    query: Query,
    cachePolicy: SingleValueCachePolicy = .default,
    contextIdentifier: UUID? = nil,
    queue: DispatchQueue = .main
  ) async throws -> GraphQLResult<Query.Data> {
    try await withCheckedThrowingContinuation { continuation in
      self.fetch(
        query: query,
        cachePolicy: cachePolicy.toCachePolicy,
        contextIdentifier: contextIdentifier,
        queue: queue
      ) { result in
        continuation.resume(with: result)
      }
    }
  }

  func fetchCacheAndData<Query: GraphQLQuery>(
    query: Query,
    contextIdentifier: UUID? = nil,
    queue: DispatchQueue = .main
  ) async throws -> AsyncThrowingStream<GraphQLResult<Query.Data>, Error> {
    AsyncThrowingStream { continuation in
      self.fetch(
        query: query,
        cachePolicy: .returnCacheDataAndFetch,
        contextIdentifier: contextIdentifier,
        queue: queue
      ) { result in

        continuation.yield(with: result)

        if case .success(let graphQLResult) = result,
           graphQLResult.source == .server {
          continuation.finish(throwing: nil)
        }
      }
    }
  }

  func watch<Query: GraphQLQuery>(
    query: Query,
    cachePolicy: CachePolicy = .default,
    callbackQueue: DispatchQueue = .main
  ) -> GraphQLQueryAsyncWatcher<Query> {
    GraphQLQueryAsyncWatcher(
      client: self,
      query: query,
      cachePolicy: cachePolicy,
      callbackQueue: callbackQueue)
  }

  func perform<Mutation: GraphQLMutation>(
    mutation: Mutation,
    publishResultToStore: Bool = true,
    queue: DispatchQueue = .main
  ) async throws -> GraphQLResult<Mutation.Data> {
    try await withCheckedThrowingContinuation { continuation in
      self.perform(
        mutation: mutation,
        publishResultToStore: publishResultToStore,
        queue: queue
      ) { result in
        continuation.resume(with: result)
      }
    }
  }

  func upload<Operation: GraphQLOperation>(
    operation: Operation,
    files: [GraphQLFile],
    queue: DispatchQueue = .main
  ) async throws -> GraphQLResult<Operation.Data> {
    try await withCheckedThrowingContinuation { continuation in
      self.upload(
        operation: operation,
        files: files,
        queue: queue
      ) { result in
        continuation.resume(with: result)
      }
    }
  }

  func subscribe<Subscription: GraphQLSubscription>(
    subscription: Subscription,
    queue: DispatchQueue = .main
  ) -> AsyncThrowingStream<GraphQLResult<Subscription.Data>, Error> {
    AsyncThrowingStream { continuation in
      let cancellable = self.subscribe(
        subscription: subscription,
        queue: queue
      ) { result in
        continuation.yield(with: result)
      }

      continuation.onTermination = { _ in
        cancellable.cancel()
      }
    }
  }
}
