//
//  ScrollingViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 10/6/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class ScrollingViewController : XibViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollview : UIScrollView?
    var dismissKeyboardGestureRecognizer : UITapGestureRecognizer?
    
    override func getXibName() -> String { return "ScrollingView" }

    override func viewDidLoad() {
        super.viewDidLoad()
        startObservingKeyboardEvents()
        dismissKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        scrollview?.addGestureRecognizer(dismissKeyboardGestureRecognizer!)
    }
    
    deinit {
        stopObservingKeyboardEvents()
        dismissKeyboardGestureRecognizer = nil
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func startObservingKeyboardEvents() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector:Selector("keyboardWillShow:"),
            name:UIKeyboardWillShowNotification,
            object:nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector:Selector("keyboardWillHide:"),
            name:UIKeyboardWillHideNotification,
            object:nil)
    }
    
    private func stopObservingKeyboardEvents() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize: CGSize = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size {
                if let scrollview = self.scrollview {
                    scrollview.contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height+10, 0.0);
                }
            }
        }
    }
    
    
    func keyboardWillHide(notification: NSNotification) {
        scrollview?.contentInset = UIEdgeInsetsZero;
    }
    
}