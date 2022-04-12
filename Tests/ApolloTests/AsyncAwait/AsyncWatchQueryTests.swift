import XCTest
@testable import Apollo
import ApolloTestSupport
import StarWarsAPI

@available(iOS 15, macOS 12, *)
class AsyncWatchQueryTests: WatchQueryTests {

  override func makeWatcher<Query: GraphQLQuery>(
    client: ApolloClientProtocol,
    query: Query,
    resultObserver: AsyncResultObserver<GraphQLResult<Query.Data>, Error>
  ) -> GraphQLQueryWatcherProtocol {

    let watcher = GraphQLQueryAsyncWatcher(
      client: client,
      query: query)

    resultObserver.awaitingHandler(watcher)

    return watcher
  }
}
