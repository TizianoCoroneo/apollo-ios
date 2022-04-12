@testable import Apollo
import XCTest

final class SingleValueCachePolicyTests: XCTestCase {

  private func makeCachePolicy(
    from singleValuePolicy: SingleValueCachePolicy,
    expect expectedCachePolicy: CachePolicy?
  ) {
    let resultingCachePolicy = singleValuePolicy.toCachePolicy
    XCTAssertEqual(resultingCachePolicy, expectedCachePolicy)
  }

  private func makeSingleValueCachePolicy(
    from cachePolicy: CachePolicy,
    expect expectedSingleValuePolicy: SingleValueCachePolicy?
  ) {
    let singleValuePolicy = SingleValueCachePolicy(from: cachePolicy)
    XCTAssertEqual(singleValuePolicy, expectedSingleValuePolicy)
  }

  func testReturnCacheDataElseFetch() throws {
    makeCachePolicy(
      from: .returnCacheDataElseFetch,
      expect: .returnCacheDataElseFetch)
    makeSingleValueCachePolicy(
      from: .returnCacheDataElseFetch,
      expect: .returnCacheDataElseFetch)
  }

  func testFetchIgnoringCacheData() throws {
    makeCachePolicy(
      from: .fetchIgnoringCacheData,
      expect: .fetchIgnoringCacheData)
    makeSingleValueCachePolicy(
      from: .fetchIgnoringCacheData,
      expect: .fetchIgnoringCacheData)
  }

  func testFetchIgnoringCacheCompletely() throws {
    makeCachePolicy(
      from: .fetchIgnoringCacheCompletely,
      expect: .fetchIgnoringCacheCompletely)
    makeSingleValueCachePolicy(
      from: .fetchIgnoringCacheCompletely,
      expect: .fetchIgnoringCacheCompletely)
  }

  func testReturnCacheDataDontFetch() throws {
    makeCachePolicy(
      from: .returnCacheDataDontFetch,
      expect: .returnCacheDataDontFetch)
    makeSingleValueCachePolicy(
      from: .returnCacheDataDontFetch,
      expect: .returnCacheDataDontFetch)
  }

  func testReturnCacheDataAndFetch() throws {
    makeSingleValueCachePolicy(
      from: .returnCacheDataAndFetch,
      expect: nil)
  }

}
