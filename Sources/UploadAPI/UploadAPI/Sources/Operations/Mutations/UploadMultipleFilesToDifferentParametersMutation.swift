// @generated
// This file was automatically generated and should not be edited.

import NewApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable

public class UploadMultipleFilesToDifferentParametersMutation: GraphQLMutation {
  public static let operationName: String = "UploadMultipleFilesToDifferentParameters"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      mutation UploadMultipleFilesToDifferentParameters($singleFile: Upload!, $multipleFiles: [Upload!]!) {
        multipleParameterUpload(singleFile: $singleFile, multipleFiles: $multipleFiles) {
          __typename
          id
          path
          filename
          mimetype
        }
      }
      """
    ))

  public var singleFile: Upload
  public var multipleFiles: [Upload]

  public init(
    singleFile: Upload,
    multipleFiles: [Upload]
  ) {
    self.singleFile = singleFile
    self.multipleFiles = multipleFiles
  }

  public var variables: Variables? {
    ["singleFile": singleFile,
     "multipleFiles": multipleFiles]
  }

  public struct Data: UploadAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { .Object(UploadAPI.Mutation.self) }
    public static var selections: [Selection] { [
      .field("multipleParameterUpload", [MultipleParameterUpload].self, arguments: [
        "singleFile": .variable("singleFile"),
        "multipleFiles": .variable("multipleFiles")
      ]),
    ] }

    public var multipleParameterUpload: [MultipleParameterUpload] { __data["multipleParameterUpload"] }

    /// MultipleParameterUpload
    ///
    /// Parent Type: `File`
    public struct MultipleParameterUpload: UploadAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { .Object(UploadAPI.File.self) }
      public static var selections: [Selection] { [
        .field("id", ID.self),
        .field("path", String.self),
        .field("filename", String.self),
        .field("mimetype", String.self),
      ] }

      public var id: ID { __data["id"] }
      public var path: String { __data["path"] }
      public var filename: String { __data["filename"] }
      public var mimetype: String { __data["mimetype"] }
    }
  }
}
