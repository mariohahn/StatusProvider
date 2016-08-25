//
//  ViewController.swift
//  StatusProvider
//
//  Created by MarioHahn on 25/08/16.
//  Copyright © 2016 MarioHahn. All rights reserved.
//

import UIKit
import StatusProvider

class MyCustomEmtyView: UIView { }
class MyCustomLoadingView: UIView { }
class MyCustomErrorView: UIView, ErrorStatusDisplaying {

    var error: NSError?{
        didSet{ /*do your Sh** */}
    }
    
    var retry: (() -> Void)?{
        didSet{ /*do your Sh** */}
    }
}

extension YourViewController: StatusProvider {

    var emptyView: UIView?{
        return MyCustomEmtyView()
    }
    
    var loadingView: UIView?{
        return MyCustomLoadingView()
    }
    
    var errorView: ErrorStatusDisplaying? {
        return MyCustomErrorView()
    }
}

class YourViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataAsynchron()
    }
    
    func loadDataAsynchron() {
        
        show(statusType: .Emty)
        show(statusType: .Loading)
        
        dispatch_after(dispatch_time( DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))),dispatch_get_main_queue()){
            
            let error = NSError(domain: "my.domain", code: 405, userInfo: [NSLocalizedDescriptionKey : "Oh... fu**"])
            
            self.show(statusType: StatusProviderType.Error(error: error, retry: {
                self.loadDataAsynchron()
            }))
        }
    }
}

func delay(delay:Double, closure:()->()) {


}

