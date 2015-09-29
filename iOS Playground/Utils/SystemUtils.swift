//
//  SystemUtils.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/25/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

struct OSVersion {
    let major : Int
    let minor : Int
    func isEqualToOrGreaterThan(comparedTo:OSVersion) -> Bool {
        return major>=comparedTo.major && minor>=comparedTo.minor
    }
}


class SystemUtils {
    
    static func getOSVersion () -> OSVersion {
        let versionArray = UIDevice.currentDevice().systemVersion.componentsSeparatedByString(".")
        
        let version = OSVersion(major: Int(versionArray[0])!, minor: Int(versionArray[1])!)
        return version
    }
    
    
}