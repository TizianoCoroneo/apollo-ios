//
//  CodegenExtensionTests.swift
//  ApolloCodegenTests
//
//  Created by Ellen Shapiro on 3/2/20.
//  Copyright © 2020 Apollo GraphQL. All rights reserved.
//

import XCTest
@testable import ApolloCodegenLib

// Only available on macOS
#if os(macOS)

class CodegenExtensionTests: XCTestCase {
  
  // MARK: - Optional Boolean
  
  func testOptionalBoolean() {
    var optionalBoolean: Bool? = nil
    XCTAssertFalse(optionalBoolean.apollo_boolValue)
    
    optionalBoolean = true
    XCTAssertTrue(optionalBoolean.apollo_boolValue)

    optionalBoolean = false
    XCTAssertFalse(optionalBoolean.apollo_boolValue)
  }
  
  // MARK: String
  
  func testDroppingSuffixThatDoesExist() throws {
    let word = "testing"
    let suffix = "ing"
    
    let dropped = try word.apollo_droppingSuffix(suffix)
    XCTAssertEqual(dropped, "test")
  }
  
  func testDroppingSuffixThatDoesntExist() {
    let word = "testing"
    let suffix = "n"
    
    do {
      _ = try word.apollo_droppingSuffix(suffix)
      XCTFail("Well that shouldn't have worked")
    } catch {
      switch error {
      case String.ApolloStringError.expectedSuffixMissing(let expectedSuffix):
        XCTAssertEqual(expectedSuffix, suffix)
      default:
        XCTFail("Unexpected error: \(error)")
      }
    }
  }
  
}

#endif
