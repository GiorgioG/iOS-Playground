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

class TouchIDViewController: XibViewController {

    @IBOutlet var touchIDButton: UIButton?
    @IBOutlet var touchIDResultLabel: UILabel?

    override func getXibName() -> String { return "TouchIDView" }

    override func loadView() {
        super.loadView()

        self.title = "Touch ID"
        if let touchIDButton = self.touchIDButton {
            touchIDButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        } else {
            SystemUtils.CrashWithLogMessage("Something very bad happened.")
        }

    }

    func buttonAction(sender: UIButton!)
    {
        let context: LAContext = LAContext()
        var error: NSError?
        let reasonString = "Go ahead touch it."
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            [context .evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: { (success: Bool, evalPolicyError: NSError?) -> Void in

                dispatch_async(dispatch_get_main_queue(), { () -> Void in

                    if success {
                        self.touchIDResultLabel!.text = "Authentication Successful!"
                        self.touchIDResultLabel!.textColor = UIColor.blackColor()
                    }
                    else {
                        self.touchIDResultLabel!.textColor = UIColor.redColor()
                        if let policyError = evalPolicyError {
                            SystemUtils.log(policyError.localizedDescription)

                            switch policyError.code {

                            case LAError.SystemCancel.rawValue:
                                self.touchIDResultLabel!.text = "Authentication was cancelled by the system"

                            case LAError.UserCancel.rawValue:
                                self.touchIDResultLabel!.text = "Authentication was cancelled by the user"

                            default:
                                self.touchIDResultLabel!.text = "Authentication failed"
                            }
                        }
                    }
                })
            })]
        }
    }
}
