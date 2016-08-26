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
    
    //    LabelWithActivity
    //
    //    var loadingView: UIView?{
    //        let activity = LoadingStatusView(loadingStyle: .LabelWithActivity)
    //        return activity
    //    }
    
    //    Label
    //
    //    var loadingView: UIView?{
    //        let activity = LoadingStatusView(loadingStyle: .Label)
    //        return activity
    //    }
    
    //    Activity
    //
    //    var loadingView: UIView?{
    //        let activity = LoadingStatusView(loadingStyle: .Activity)
    //        return activity
    //    }
    
    //    Change Color
    //
    //    var loadingView: UIView?{
    //         let activity = LoadingStatusView(loadingStyle: .Activity)
    //         activity.tintColor = UIColor.greenColor()
    //         return activity
    //    }
    
}

class ActivityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        show(statusType: .Loading)
    }
}