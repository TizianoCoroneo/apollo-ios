import XCTest

import ApolloCacheDependentTests
import ApolloCodegenTests
import ApolloSQLiteTests
import ApolloTests
import ApolloWebsocketTests

var tests = [XCTestCaseEntry]()
tests += ApolloCacheDependentTests.__allTests()
tests += ApolloCodegenTests.__allTests()
tests += ApolloSQLiteTests.__allTests()
tests += ApolloTests.__allTests()
tests += ApolloWebsocketTests.__allTests()

XCTMain(tests)
