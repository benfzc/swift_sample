//
//  SecondViewController.swift
//  ThreeLevelNavigation
//
//  Created by ben on 2018/6/29.
//  Copyright © 2018年 ben. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var recvMsgFromFirst = ""
    
    @IBOutlet weak var recvMsgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // update received message to label
        recvMsgLabel.text = recvMsgFromFirst
    }


    @IBOutlet weak var msgTextField: UITextField!
    
    @IBAction func sendMsgToThirdView(_ sender: Any) {
        // instantiate ThirdViewController class with its storyboard ID
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "thirdViewController") as? ThirdViewController else {
            return
        }
        
        if let msg = msgTextField.text {
            // pass message to ThirdViewController
            nextViewController.recvMsgFromSecond = msg
        }
        
        // show third view
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
