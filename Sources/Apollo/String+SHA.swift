import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
#if os(Linux)
import Crypto
#else
import CryptoKit
import CommonCrypto
#endif

extension String {

  var sha256Hash: String {
    let data = self.data(using: .utf8)!

    #if os(Linux)
    let hash = SHA256.hash(data: data)
    return hash.compactMap { String(format: "%02x", $0) }.joined()

    #else
    if #available(iOS 13, OSX 10.15, tvOS 13, *) {
        let hash = SHA256.hash(data: data)
        return hash.compactMap { String(format: "%02x", $0) }.joined()

    } else {
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
        }

        return hash.compactMap { String(format: "%02x", $0) }.joined()
    }
    #endif
  }
}
