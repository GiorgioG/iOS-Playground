//
//  ViewController.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/24/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController{
    
    let playgroundItems : [PlaygroundItem] = [
        PlaygroundItem(name: "Touch ID", sortIndex: 0, iconAssetName: "TouchID",caption: "Last modified: 9/25/2015", viewControllerClass:TouchIDViewController.self, isEnabledCheck: {
            let isEnabled = SystemUtils.getOSVersion().isEqualToOrGreaterThan(OSVersion(major:8, minor:0))
            return isEnabled
        }),
        PlaygroundItem(name: "Animated Modal Overlay", sortIndex: 0, iconAssetName: "AnimatedModalOverlay",caption: "Last modified: 9/28/2015", viewControllerClass:AnimatedModalOverlayViewController.self, isEnabledCheck: nil)
    ]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupTableView() {
        if let tableView = self.tableView {
            tableView.separatorColor = UIColor.clearColor()
            let inset = UIEdgeInsetsMake(20, 0, 0, 0)
            self.tableView.contentInset = inset
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playgroundItems.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = self.playgroundItems[indexPath.row] as PlaygroundItem
        let controllerType = item.viewControllerClass  as! UIViewController.Type
        let controller = controllerType.init(nibName:nil, bundle:nil)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = self.playgroundItems[indexPath.row] as PlaygroundItem
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        cell.textLabel!.text = item.name
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        if let iconAssetName = item.iconAssetName {
            cell.imageView?.image = UIImage(named: iconAssetName)
        }
        
        if let caption = item.caption {
            cell.detailTextLabel?.text = caption
        }
        if let isEnabledCheck = item.isEnabledCheck {
            let isEnabled = isEnabledCheck()
            if(isEnabled) {
                
                let enabledAlpha = CGFloat(1.0)
                cell.textLabel!.alpha = enabledAlpha
                cell.detailTextLabel!.alpha = enabledAlpha
                cell.imageView?.alpha = enabledAlpha
                cell.userInteractionEnabled = true
                
            } else {
                
                let disabledAlpha = CGFloat(0.439216)
                cell.imageView?.alpha = disabledAlpha
                cell.textLabel!.alpha = disabledAlpha
                cell.detailTextLabel!.alpha = disabledAlpha
                cell.userInteractionEnabled = false            }
        } else {
            let enabledAlpha = CGFloat(1.0)
            cell.textLabel!.alpha = enabledAlpha
            cell.detailTextLabel!.alpha = enabledAlpha
            cell.imageView?.alpha = enabledAlpha
            cell.userInteractionEnabled = true
        }
        
        
        return cell
    }
    
    
}

