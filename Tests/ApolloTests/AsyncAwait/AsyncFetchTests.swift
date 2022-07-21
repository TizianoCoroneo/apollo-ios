import XCTest
@testable import Apollo
import ApolloTestSupport
import StarWarsAPI

@available(iOS 15, macOS 12, *)
class AsyncFetchTests: XCTestCase, CacheDependentTesting, StoreLoading {
  var cacheType: TestCacheProvider.Type { InMemoryTestCacheProvider.self }

  var cache: NormalizedCache!
  var store: ApolloStore!
  var server: MockGraphQLServer!
  var client: ApolloClient!

  override func setUpWithError() throws {
    try super.setUpWithError()

    self.cache = try self.makeNormalizedCache()
    self.store = ApolloStore(cache: cache)
    self.server = MockGraphQLServer()
    self.client = ApolloClient(
      networkTransport: MockNetworkTransport(server: self.server, store: self.store),
      store: self.store
    )
  }

  override func tearDownWithError() throws {
    self.cache = nil
    self.store = nil
    self.server = nil
    self.client = nil

    try super.tearDownWithError()
  }

  func testPerformMutation() async throws {
    let mutation = CreateReviewForEpisodeMutation(episode: .newhope, review: .init(stars: 3))
    let resultObserver = self.makeResultObserver(for: mutation)

    let expected: [String: Any] = [
      "data": [
        "createReview": [
          "__typename": "Review",
          "stars": 3,
          "commentary": ""
        ]
      ]
    ]

    let serverRequestExpectation = self.server.expect(CreateReviewForEpisodeMutation.self) { _ in
      expected
    }
    let performResultFromServerExpectation = resultObserver.expectation(description: "Mutation was successful") { _ in }

    let result = try await resultObserver.awaitingHandler(
      await self.client.perform(
        mutation: mutation,
        publishResultToStore: false))

    let dataContent = try XCTUnwrap(expected["data"] as? [String: Any])

    XCTAssertEqual(
      result.data?.createReview?.stars,
      CreateReviewForEpisodeMutation.Data(unsafeResultMap: dataContent).createReview?.stars)
    XCTAssertEqual(
      result.data?.createReview?.commentary,
      CreateReviewForEpisodeMutation.Data(unsafeResultMap: dataContent).createReview?.commentary)

    self.wait(for: [serverRequestExpectation, performResultFromServerExpectation], timeout: Self.defaultWaitTimeout)
  }
}
