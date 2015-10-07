//
//  ModalDialogViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/28/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class ModalDialogViewController : XibViewController {
    weak var presentingView : UIView?
    weak var button : UIButton?
    
    override func getXibName() -> String { return "ModalDialogView" }
    
    override func loadView() {
        super.loadView()
        button = self.view.viewWithTag(1) as? UIButton
        button?.addTarget(self, action: NSSelectorFromString("close"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func close() {
        
        if let pView = presentingView {
            UIView.beginAnimations(nil, context: nil)
            pView.transform = CGAffineTransformIdentity
            UIView.commitAnimations()
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
}