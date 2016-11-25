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

extension ActivityViewController: StatusProvider {
    
    var loadingView: UIView? {
        let view = LoadingView()
        view.titleLabel.text = "Lädt…"
        view.activityIndicatorView.activityIndicatorViewStyle = .gray
        return view
    }
}

class ActivityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Loading"
        
        
        show(statusType: .loading)
    }
}
