
import Foundation
import CoreFoundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension Bundle {

  /// Type-safe getter for info dictionary key objects
  ///
  /// - Parameter key: The key to try to grab an object for
  /// - Returns: The object of the desired type, or nil if it is not present or of the incorrect type.
  func bundleValue<T>(forKey key: String) -> T? {
    return object(forInfoDictionaryKey: key) as? T
  }

  /// The build number of this bundle (kCFBundleVersion) as a string, or nil if not present.
  var buildNumber: String? {
    return self.bundleValue(forKey: String(kCFBundleVersionKey))
  }

  /// The short version string for this bundle, or nil if not present.
  var shortVersion: String? {
    return self.bundleValue(forKey: "CFBundleShortVersionString")
  }
}
