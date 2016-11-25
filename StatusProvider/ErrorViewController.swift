//
//  ErrorViewController.swift
//  StatusProvider
//
//  Created by MarioHahn on 26/08/16.
//  Copyright © 2016 MarioHahn. All rights reserved.
//

import Foundation
import UIKit
import StatusProvider

extension ErrorViewController: StatusController {
    
}

class ErrorViewController: UIViewController {
    
    let asdjasd = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Error"
        
        let status = Status(title: "Error", description: "Oh... fu**", actionTitle: "Retry 🚀") {
            
        }
        
        show(status: status)        
    }
}
