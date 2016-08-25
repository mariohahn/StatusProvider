//
//  LoadingStatusView.swift
//  3MobileTV
//
//  Created by MarioHahn on 25/08/16.
//  Copyright © 2016 Hutchison Drei Austria GmbH. All rights reserved.
//

import Foundation
import UIKit

public class LoadingStatusView: UIView {
    
    public enum LoadingStyle {
        case LabelWithActivty
        case Label
        case Activity
    }
    
    let activityIndicatorView: UIActivityIndicatorView = {
        $0.startAnimating()
        
        return $0
    }(UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge))
    
    let loadingLabel: UILabel = {
        $0.text = "Lädt…"
        $0.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        $0.textColor = UIColor.whiteColor()
        return $0
    }(UILabel())
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .Horizontal
        $0.spacing = 10
        
        return $0
    }(UIStackView())
    
    var loadingStyle: LoadingStyle = .LabelWithActivty{
        didSet{
            adaptLoadingStyle()
        }
    }
    
    func adaptLoadingStyle() {
        loadingLabel.hidden = false
        activityIndicatorView.hidden = false
        
        switch loadingStyle {
        case .LabelWithActivty:
            break
        case .Label:
            activityIndicatorView.hidden = true
        case .Activity:
            loadingLabel.hidden = true
        }
    }
    
    public convenience init(loadingStyle style: LoadingStyle){
        self.init(frame:CGRectZero)
        
        loadingStyle = style
        adaptLoadingStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(activityIndicatorView)
        stackView.addArrangedSubview(loadingLabel)
        
        NSLayoutConstraint.activateConstraints([
            stackView.leadingAnchor.constraintEqualToAnchor(leadingAnchor),
            stackView.trailingAnchor.constraintEqualToAnchor(trailingAnchor),
            stackView.topAnchor.constraintEqualToAnchor(topAnchor),
            stackView.bottomAnchor.constraintEqualToAnchor(bottomAnchor)
            ])
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}