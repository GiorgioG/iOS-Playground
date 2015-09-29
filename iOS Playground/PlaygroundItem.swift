//
//  PlaygroundItem.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/24/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class PlaygroundItem {
    init(name: String, sortIndex: Int, iconAssetName:String?, caption:String?, viewControllerClass: AnyClass, isEnabledCheck:(() -> Bool)?) {
        self.name = name
        self.sortIndex = sortIndex
        
        if let validIconAssetName = iconAssetName{
            self.iconAssetName = "ItemIcon_" + validIconAssetName
        }
        
        self.caption = caption
        self.isEnabledCheck = isEnabledCheck
        self.viewControllerClass = viewControllerClass
    }
    
    var name : String
    var sortIndex : Int
    var viewControllerClass: AnyClass
    var iconAssetName:String?
    var caption:String?
    var isEnabledCheck: (() -> Bool)?
}