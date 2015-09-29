//
//  ModalDialogViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/28/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class ModalDialogViewController : UIViewController {
    var presentingView : UIView?
    var button : UIButton?
    override func loadView() {
        let nib = UINib(nibName: "ModalDialogView", bundle: NSBundle.mainBundle())
        self.view = nib.instantiateWithOwner(nil, options: nil)[0] as? UIView
        button = self.view.viewWithTag(1) as? UIButton
        button?.addTarget(self, action: NSSelectorFromString("close"), forControlEvents: UIControlEvents.TouchUpInside)
        self.edgesForExtendedLayout = UIRectEdge.None

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