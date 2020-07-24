import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol Matchable {
  associatedtype Base
  static func ~=(pattern: Self, value: Base) -> Bool
}
