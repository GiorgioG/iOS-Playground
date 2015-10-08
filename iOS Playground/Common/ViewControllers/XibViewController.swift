//
//  XibViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/29/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class XibViewController: UIViewController {
    func getXibName() -> String {
   return "getXibName method must be overriden by subclass"
    }

    override func loadView() {
   let nib = UINib(nibName: getXibName(), bundle: NSBundle.mainBundle())
   self.view = nib.instantiateWithOwner(self, options: nil)[0] as? UIView
   self.edgesForExtendedLayout = UIRectEdge.None
    }
}
