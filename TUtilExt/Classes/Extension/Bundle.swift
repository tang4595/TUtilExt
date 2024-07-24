//
//  Bundle.swift
//  Gallery
//
//  Created by tang on 9.7.21.
//

import Foundation
import TAppBase

var isDebug: Bool {
    #if DEBUG
        return true
    #else
        return false
    #endif
}

var isRelease = !isDebug

public extension Bundle {
    
    var displayName: String {
        return infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }
    
    var shortVersion: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? ""
    }

    var buildNumberInt: Int {
        return Int(Bundle.main.buildNumber) ?? -1
    }

    var fullVersion: String {
        let versionNumber = Bundle.main.shortVersion
        let buildNumber = Bundle.main.buildNumber
        return "\(versionNumber) (\(buildNumber))"
    }
    
    var executableName: String {
        return infoDictionary?["CFBundleExecutable"] as? String ?? ""
    }
}

public extension Bundle {
    
    static func frameworkBundle(moduleName: String) -> Bundle? {
        if var bundleURL = Bundle.main.url(forResource: "Frameworks", withExtension: nil) {
            if #available(iOS 16.0, *) {
                bundleURL = bundleURL.appending(component: moduleName)
            } else {
                bundleURL = bundleURL.appendingPathComponent(moduleName)
            }
            bundleURL = bundleURL.appendingPathExtension("framework")
            return Bundle(url: bundleURL)
        }
        return nil
    }
    
    static func fetchImage(imageName: String, moduleName: String, bundleName: String) -> UIImage? {
        if let bundle = frameworkBundle(moduleName: moduleName),
           let tempBundleURL = bundle.url(forResource: bundleName, withExtension: "bundle"),
           let tempBundle = Bundle(url: tempBundleURL) {
            return UIImage(named: imageName, in: tempBundle, compatibleWith: nil)
        }
        return nil
    }
    
    static func fetchFilePath(fileName: String, moduleName: String, bundleName: String) -> String? {
        if let bundle = frameworkBundle(moduleName: moduleName),
           let tempBundleURL = bundle.url(forResource: bundleName, withExtension: "bundle"),
           let tempBundle = Bundle(url: tempBundleURL),
           let file = tempBundle.path(forResource: fileName, ofType: nil) {
           return file
        }
        return nil
    }
    
    static func fetchFileURL(fileName: String, moduleName: String, bundleName: String) -> URL? {
        return URL(string: fetchFilePath(fileName: fileName, moduleName: moduleName, bundleName: bundleName))
    }
}

public extension String {
    
    public var image: UIImage? {
        return UIImage(named: self)
    }
    
    public func image(in bundle: Bundle?) -> UIImage? {
        return UIImage(named: self, in: bundle, with: nil)
    }
    
    public func language(in bundle: Bundle?) -> String {
        if let bundle {
            if !bundle.isLoaded { bundle.load() }
            let language = "zh-Hans"
            if let path = bundle.path(forResource: language, ofType: "lproj"), let languageBundle = Bundle(path: path) {
                return NSLocalizedString(self, tableName: nil, bundle: languageBundle, value: "", comment: "")
            }
            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        }
        return self
    }
    
    public func language(in bundle: Bundle?, args: CVarArg...) -> String {
        return String(format: language(in: bundle), args)
    }
    
    public func language(in bundle: Bundle?, args: String, args1: String) -> String {
        return String(format: language(in: bundle), args, args1)
    }
    
    public func language(in bundle: Bundle?, args: String) -> String {
        return String(format: language(in: bundle), args)
    }
}
