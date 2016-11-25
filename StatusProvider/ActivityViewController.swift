//
//  ActivityViewController.swift
//  StatusProvider
//
//  Created by MarioHahn on 26/08/16.
//  Copyright © 2016 MarioHahn. All rights reserved.
//

import Foundation
import UIKit
import StatusProvider

extension ActivityViewController: StatusController {
    
}

class ActivityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Loading"
        
        let status = Status(isLoading: true, description: "Lädt…")
        
        show(status: status)
    }
}
