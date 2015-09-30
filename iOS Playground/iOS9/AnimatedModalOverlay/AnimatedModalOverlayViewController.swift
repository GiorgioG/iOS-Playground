//
//  AnimatedModalOverlayViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/28/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class AnimatedModalOverlayViewController : XibViewController {
    var rightButton : UIBarButtonItem?
    
    override func loadView() {
        super.loadView()
        rightButton = UIBarButtonItem(title: "Show", style: UIBarButtonItemStyle.Plain, target: self, action: NSSelectorFromString("showDialog"))
        self.navigationItem.rightBarButtonItem = rightButton
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    func showDialog(){
        
        let modalViewController = ModalDialogViewController()
        // I don't like this, but I can't figure out how to get at this view from the dialog...
        modalViewController.presentingView = self.view
        modalViewController.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        modalViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(modalViewController, animated: true, completion: nil)
        
        UIView.beginAnimations(nil, context: nil)
        view.transform = CGAffineTransformScale(view.transform, 0.95, 0.95);
        UIView.commitAnimations()
        
    }
    
    override func getXibName() -> String {
        return "AnimatedModalOverlayView"
    }
    
}