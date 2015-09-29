//
//  AnimatedModalOverlayViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/28/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class AnimatedModalOverlayViewController : UIViewController {
    var rightButton : UIBarButtonItem?
    override func loadView() {
        let nib = UINib(nibName: "AnimatedModalOverlayView", bundle: NSBundle.mainBundle())
        self.view = nib.instantiateWithOwner(nil, options: nil)[0] as? UIView
        rightButton = UIBarButtonItem(title: "Show", style: UIBarButtonItemStyle.Plain, target: self, action: NSSelectorFromString("showDialog"))
        self.navigationItem.rightBarButtonItem = rightButton
        self.edgesForExtendedLayout = UIRectEdge.None

    }
    
    func showDialog(){
        let modalViewController = ModalDialogViewController()
        modalViewController.presentingView = self.view
        modalViewController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        modalViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(modalViewController, animated: true, completion: nil)
        
        
        UIView.beginAnimations(nil, context: nil)
            view.transform = CGAffineTransformScale(view.transform, 0.95, 0.95);
        UIView.commitAnimations()

    }
    
}