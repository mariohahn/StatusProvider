//
//  EmptyViewController.swift
//  StatusProvider
//
//  Created by MarioHahn on 26/08/16.
//  Copyright © 2016 MarioHahn. All rights reserved.
//

import Foundation
import UIKit
import StatusProvider

class EmptyViewController: UIViewController, StatusController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Empty"
        
        let status = Status(title: "no Data", description: "No data available.💣", actionTitle: "Create ⭐️", image: UIImage(named: "placeholder_instagram")) {
            self.hideStatus()
        }    
        
        show(status: status)        
    }
}

class EmptyStatusTestView: UIView {
    
}

extension EmptyStatusTestView: StatusController {
    
    var statusView: StatusView? {
        return DefaultStatusView()
    }
}
