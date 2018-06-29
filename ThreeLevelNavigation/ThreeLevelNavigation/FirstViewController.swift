//
//  ViewController.swift
//  ThreeLevelNavigation
//
//  Created by ben on 2018/6/29.
//  Copyright © 2018年 ben. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var recvMsgLabel: UILabel!
    var recvMsgFromThird = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register a notification
        let notification = Notification.Name("NotifyFirstView")
        NotificationCenter.default.addObserver(self, selector: #selector(msgUpdate(noti:)), name: notification, object: nil)
    }
    
    // notification handler
    @objc func msgUpdate(noti:Notification) {
        let msg = noti.userInfo!["msg"] as! String
        recvMsgLabel.text = msg
    }


    @IBOutlet weak var msgTextField: UITextField!
    
    @IBAction func sendMsgToSecondView(_ sender: Any) {
        // instantiate SecondViewController class with its storyboard ID
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "secondViewController") as? SecondViewController else {
            return
        }
        
        if let msg = msgTextField.text {
            // pass message to SecondViewController
            nextViewController.recvMsgFromFirst = msg
        }
        
        // show second view
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    

}

