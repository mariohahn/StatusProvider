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

extension EmptyViewController: StatusProvider {
    
    var emptyView: EmptyStatusDisplaying?{
        return EmptyStatusView(title: "No Data", caption: "No data available.💣", image:  UIImage(named: "placeholder_instagram"), actionTitle: "Create ⭐️")
    }
    
}

class EmptyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Empty"
        
        show(statusType: StatusProviderType.Empty(action: {
            self.show(statusType: .Loading)
        }))
    }
    
}