import Foundation
#if os(Linux) && canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// Supported HTTP methods for Apollo
enum GraphQLHTTPMethod: String {
    case GET
    case POST
}
