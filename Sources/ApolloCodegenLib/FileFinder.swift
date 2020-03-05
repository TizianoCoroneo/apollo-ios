import Foundation

// Only available on macOS
#if os(macOS)

public struct FileFinder {
    
    public static func findParentFolder(from filePath: StaticString = #file) -> URL {
        self.findParentFolder(from: filePath.apollo_toString)
    }
    
    public static func findParentFolder(from filePath: String) -> URL {
        let url = URL(fileURLWithPath: filePath)
        return url.deletingLastPathComponent()
    }
}

#endif
