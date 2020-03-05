import Foundation

// Only available on macOS
#if os(macOS)

class ASTEnumValue: Codable {
  /// The raw name of the enum value
  let name: String
  
  /// The description of the enum value
  let description: String
  
  /// If the enum value is deprecated.
  let isDeprecated: Bool
}

#endif
