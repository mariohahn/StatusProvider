//
//  EmtyViewController.swift
//  StatusProvider
//
//  Created by MarioHahn on 26/08/16.
//  Copyright © 2016 MarioHahn. All rights reserved.
//

import Foundation
import UIKit
import StatusProvider

extension EmtyViewController: StatusProvider {
    
    var emptyView: EmtyStatusDisplaying?{
        return EmtyStatusView(title: "No Data", caption: "No data available.💣", image:  UIImage(named: "placeholder_instagram"), actionTitle: "Create ⭐️")        
    }
    
}

class EmtyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        show(statusType: StatusProviderType.Emty(action: { 
            self.show(statusType: .Loading)
        }))
    }
    
}