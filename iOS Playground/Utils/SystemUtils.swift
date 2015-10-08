//
//  SystemUtils.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/25/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

struct OSVersion {
    let major: Int
    let minor: Int
    func isEqualToOrGreaterThan(comparedTo: OSVersion) -> Bool {
        return major>=comparedTo.major && minor>=comparedTo.minor
    }
}

class SystemUtils {

    static func getOSVersion () -> OSVersion {
        let versionArray = UIDevice.currentDevice().systemVersion.componentsSeparatedByString(".")
        let version = OSVersion(major: Int(versionArray[0])!, minor: Int(versionArray[1])!)
        return version
    }
    static func isTouchIDAvailable () -> Bool {
        let context = LAContext()
        return context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error:nil)
    }

    static func is3DTouchAvailable () -> Bool {
        return UIScreen.mainScreen().traitCollection.forceTouchCapability==UIForceTouchCapability.Available
    }

    static func CrashWithLogMessage(logMessage: String?) {
        SystemUtils.log(logMessage)
        var crashWithMissingValueInDicitonary = Dictionary<Int,Int>()
        _ = crashWithMissingValueInDicitonary[1]!
    }

    static func log(logMessage: String?) {
        if let logMsg = logMessage {
            SystemUtils.log(logMsg)
        }
    }

    static func log(logMessage: String) {
        print(logMessage)
    }
}
