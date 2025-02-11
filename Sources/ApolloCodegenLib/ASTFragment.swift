import Foundation

// Only available on macOS
#if os(macOS)

/// A resuable fragment to generate code for
class ASTFragment: Codable {
  /// The primary type the fragment is defined on
  let typeCondition: ASTVariableType
  
  /// All possible types that fragment could represent, if for instance the primary type is a Union or an Interface.
  let possibleTypes: [ASTVariableType]
  
  /// The name of the fragment
  let fragmentName: String
  
  /// The full file path to the file where this fragment was defined on the filesystem where the AST was generated.
  let filePath: String
  
  /// The raw string source of the fragment
  let source: String
  
  /// The fields requested in this fragment
  let fields: [ASTField]
  
  /// Names of fragments referenced at this level.
  let fragmentSpreads: [String]
  
  /// Fragments defined inline at this level
  let inlineFragments: [ASTInlineFragment]
}

/// A fragment defined inline on a particuar object type such as `... on Droid { name }`
class ASTInlineFragment: Codable {
  /// The primary type the fragment is defined on
  let typeCondition: ASTVariableType
  
  /// All possible types that fragment could represent, if for instance the primary type is a Union or an Interface.
  let possibleTypes: [ASTVariableType]
  
  /// The fields requested in this fragment
  let fields: [ASTField]
  
  /// The names of any named fragments at this level of the fragment.
  let fragmentSpreads: [String]
}

#endif
