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

extension ErrorViewController: StatusProvider {
    
}

class ErrorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Error"
        
        let error = NSError(domain: "my.domain", code: 405, userInfo: [NSLocalizedDescriptionKey : "Oh... fu**"])
        
        show(statusType: .Error(error: error, retry: {
            self.show(statusType: .Loading)
        }))
    }
}