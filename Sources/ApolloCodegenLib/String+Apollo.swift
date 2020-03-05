import Foundation

// Only available on macOS
#if os(macOS)

extension String {
  enum ApolloStringError: Error {
    case expectedSuffixMissing(_ suffix: String)
  }
  
  func apollo_droppingSuffix(_ suffix: String) throws -> String {
    guard self.hasSuffix(suffix) else {
      throw ApolloStringError.expectedSuffixMissing(suffix)
    }
    
    return String(self.dropLast(suffix.count))
  }
}

#endif
