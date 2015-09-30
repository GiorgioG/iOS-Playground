//
//  ThreeDTouchViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/29/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class ThreeDTouchViewController : XibViewController {
    
    @IBOutlet var peekImageView : UIImageView?
    @IBOutlet var forceImageView : UIImageView?
    @IBOutlet var forceLabel : UILabel?
    
    
    //TODO: Demo Peek & Pop
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches{
            if(touch.force>0.0) {
                if(CGRectContainsPoint((self.forceImageView?.frame)!, touch.locationInView(self.view)))                  {
                    self.forceLabel!.text = NSString(format: "%.2f",touch.force) as String
                }
            }
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        forceLabel!.text = ""
    }
    
    override func getXibName() -> String {
        return "ThreeDTouchView"
    }
}