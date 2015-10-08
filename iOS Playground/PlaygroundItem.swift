//
//  PlaygroundItem.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/24/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit
import CoreSpotlight

class PlaygroundItem {
    let name: String
    let sortIndex: Int
    let viewControllerClass: AnyClass
    let iconAssetName: String?
    let caption: String?
    let isEnabledCheck: (() -> Bool)?
    let userActivity: NSUserActivity?

    init(name: String, searchKeywords: [String]?, sortIndex: Int, iconAssetName: String?, caption: String?, viewControllerClass: AnyClass, isEnabledCheck: (() -> Bool)?) {
        self.name = name
        self.sortIndex = sortIndex

        if let validIconAssetName = iconAssetName{
            self.iconAssetName = "ItemIcon_" + validIconAssetName
        } else {
            self.iconAssetName = nil
        }


        self.caption = caption
        self.isEnabledCheck = isEnabledCheck
        self.viewControllerClass = viewControllerClass

        var shouldCreateUserActivity = true // If the device does not support the sample, don't bother indexing it - it's just noise to the user.
        if let enabledCheck = isEnabledCheck {
            shouldCreateUserActivity = enabledCheck()
        }


        if shouldCreateUserActivity {
            userActivity = NSUserActivity(activityType: NSBundle.mainBundle().bundleIdentifier!+".Example")
            userActivity!.title = name + " Sample"
            userActivity!.userInfo = ["id:":name]
            userActivity!.eligibleForSearch = true

            if let validIconAssetName = self.iconAssetName {
                let attributes = CSSearchableItemAttributeSet(itemContentType: "iOSPlaygroundItemType")
                attributes.thumbnailData = UIImageJPEGRepresentation(UIImage(named: validIconAssetName)!,1)
                userActivity!.contentAttributeSet = attributes
            }

            if let keywords = searchKeywords {
                userActivity!.keywords = Set(keywords)
            }
        } else {
            userActivity = nil
        }
    }
}
