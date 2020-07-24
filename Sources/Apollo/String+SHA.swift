import Foundation
import CryptoKit

extension String {

  var sha256Hash: String {
    let data = self.data(using: .utf8)!
    let hash = SHA256.hash(data: data)
    return hash.compactMap { String(format: "%02x", $0) }.joined()
  }
}
