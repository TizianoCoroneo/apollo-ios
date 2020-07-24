import Foundation
import CoreFoundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

#if os(Linux)
import Glibc
#endif

extension HTTPURLResponse {
  var isSuccessful: Bool {
    return (200..<300).contains(statusCode)
  }

  var statusCodeDescription: String {
    return HTTPURLResponse.localizedString(forStatusCode: statusCode)
  }

  var textEncoding: String.Encoding? {
    guard let encodingName = textEncodingName else { return nil }

    #if canImport(FoundationNetworking)
    let nsString = encodingName as NSString
    let cfString = unsafeBitCast(nsString, to: CFString.self)
    return String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding(cfString)))
    #else

    return String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding(encodingName as CFString)))
    #endif
  }
}
