//
//  ThirdViewController.swift
//  ThreeLevelNavigation
//
//  Created by ben on 2018/6/29.
//  Copyright © 2018年 ben. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var recvMsgFromSecond = ""
    
    @IBOutlet weak var recvMsgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // update received message to label
        recvMsgLabel.text = recvMsgFromSecond
        
    }

    
    @IBOutlet weak var msgTextField: UITextField!
    
    @IBAction func sendNotiToFirst(_ sender: Any) {
        if let msg = msgTextField.text {
            // send message to first view by notification
            let notification = Notification.Name("NotifyFirstView")
            NotificationCenter.default.post(name: notification, object: nil, userInfo: ["msg":msg])
        }
        
        // jump back to first view
        navigationController?.popToRootViewController(animated: true)
    }

}
