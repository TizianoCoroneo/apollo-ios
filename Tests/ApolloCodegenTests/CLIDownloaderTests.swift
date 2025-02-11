//
//  CLIDownloaderTests.swift
//  Apollo
//
//  Created by Ellen Shapiro on 10/22/19.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

@testable import ApolloCodegenLib
import XCTest

// Only available on macOS
#if os(macOS)

class CLIDownloaderTests: XCTestCase {
  
  func testRedownloading() throws {
    let scriptsURL = CodegenTestHelper.cliFolderURL()
    
    try CLIDownloader.forceRedownload(cliFolderURL: scriptsURL, timeout: CodegenTestHelper.timeout)
    
    let zipFileURL = ApolloFilePathHelper.zipFileURL(fromCLIFolder: scriptsURL)
    XCTAssertTrue(FileManager.default.apollo_fileExists(at: zipFileURL))
    XCTAssertEqual(try FileManager.default.apollo_shasum(at: zipFileURL), CLIExtractor.expectedSHASUM)    
  }
  
  func testTimeoutThrowsCorrectError() throws {
    let scriptsURL = CodegenTestHelper.cliFolderURL()
    
    // This file is big enough that unless both you and the server have a terabyte connection, 2 seconds won't be enough time to download it.
    do {
      try CLIDownloader.forceRedownload(cliFolderURL: scriptsURL, timeout: 2.0)
    } catch {
      guard let downloaderError = error as? CLIDownloader.CLIDownloaderError else {
        XCTFail("Wrong type of error")
        return
      }
      
      switch downloaderError {
      case .downloadTimedOut(let seconds):
        XCTAssertEqual(seconds, 2.0, accuracy: 0.0001)
      default:
        XCTFail("Wrong type of error")
      }
    }
  }
}

#endif
