//
//  ViewController.swift
//  StatusProvider
//
//  Created by MarioHahn on 25/08/16.
//  Copyright © 2016 MarioHahn. All rights reserved.
//

import UIKit
import StatusProvider

extension UIViewController: StatusProvider { }

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        show(statusType: .Loading)
//        show(statusType: .Emty)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

