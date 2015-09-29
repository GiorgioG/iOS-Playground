//
//  TouchIDViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/24/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

class TouchIDViewController : UIViewController {
    
    var touchIDButton : UIButton?
    var touchIDResultLabel : UILabel?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        loadViewFromNib()
        
        self.edgesForExtendedLayout = UIRectEdge.None

        self.title = "Touch ID"
        
        self.touchIDButton = self.view.viewWithTag(1) as? UIButton
        self.touchIDButton!.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
    
        self.touchIDResultLabel = self.view.viewWithTag(2) as? UILabel
        self.touchIDResultLabel!.text = ""
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadViewFromNib() {
        
        let nib  = UINib(nibName: "TouchIDView", bundle: NSBundle.mainBundle())
        let view = nib.instantiateWithOwner(nil, options: nil)[0] as! UIView
        self.view = view
    }
    
    func buttonAction(sender:UIButton!)
    {
        let context : LAContext = LAContext()
        var error: NSError?
        let reasonString = "Go ahead try it."
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            [context .evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: { (success: Bool, evalPolicyError: NSError?) -> Void in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    if success {
                        self.touchIDResultLabel!.text = "Success!"
                        self.touchIDResultLabel!.textColor = UIColor.greenColor()
                    }
                    else{
                        
                        self.touchIDResultLabel!.text = "Failed: \(evalPolicyError!.code)"
                        self.touchIDResultLabel!.textColor = UIColor.redColor()
                        
                        // If authentication failed then show a message to the console with a short description.
                        // In case that the error is a user fallback, then show the password alert view.
                        print(evalPolicyError?.localizedDescription)
                        
                        switch evalPolicyError!.code {
                            
                        case LAError.SystemCancel.rawValue:
                            print("Authentication was cancelled by the system")
                            
                        case LAError.UserCancel.rawValue:
                            print("Authentication was cancelled by the user")
                            
                        default:
                            print("Authentication failed")
                        }
                    }

                })
                
            })]

    }
    
}
}
