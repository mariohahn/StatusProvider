//
//  EmtyStatusView.swift
//  3MobileTV
//
//  Created by MarioHahn on 25/08/16.
//  Copyright © 2016 Hutchison Drei Austria GmbH. All rights reserved.
//

import Foundation
import UIKit

public class EmtyStatusView: UIView, EmtyStatusDisplaying {
    
    public var action: (() -> Void)?{
        didSet{
            guard let _ = action else { return }
            
            emtyActionButton.hidden = false
        }
    }
    
    let emtyActionButton: UIButton = {
        $0.hidden = true        
        return $0
    }(UIButton(type: .System))
    
    let emtyTitleLabel: UILabel = {
        $0.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        $0.textColor = UIColor.blackColor()
        $0.textAlignment = .Center
        
        return $0
    }(UILabel())
    
    let emtyDescriptionLabel: UILabel = {
        $0.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        $0.textColor = UIColor.blackColor()
        $0.textAlignment = .Center
        $0.numberOfLines = 0
        
        return $0
    }(UILabel())
    
    let emtyImageView: UIImageView = {
        $0.contentMode = .Center
        
        return $0
    }(UIImageView())
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .Vertical
        $0.spacing = 10
        
        return $0
    }(UIStackView())
    
    public convenience init(title: String?, caption: String?, image: UIImage? = nil, actionTitle: String? = nil){
        self.init(frame: CGRectZero)
        
        emtyActionButton.addTarget(self, action: #selector(EmtyStatusView.emtyButtonAction), forControlEvents: .PrimaryActionTriggered)
        
        if let title = title where title.characters.count > 0 {
            emtyTitleLabel.text = title
        }else{
            emtyTitleLabel.hidden = true
        }
        
        if let caption = caption where caption.characters.count > 0 {
            emtyDescriptionLabel.text = caption
        }else{
            emtyDescriptionLabel.hidden = true
        }
        
        if let image = image{
            emtyImageView.image = image
        }else{
            emtyImageView.hidden = true
        }
        
        if let actionTitle = actionTitle where actionTitle.characters.count > 0 {
            emtyActionButton.setTitle(actionTitle, forState: .Normal)
        }
    }
    
    
    func emtyButtonAction() {
        action?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(emtyImageView)
        stackView.addArrangedSubview(emtyTitleLabel)
        stackView.addArrangedSubview(emtyDescriptionLabel)
        stackView.addArrangedSubview(emtyActionButton)
        
        NSLayoutConstraint.activateConstraints([
            stackView.leadingAnchor.constraintEqualToAnchor(leadingAnchor),
            stackView.trailingAnchor.constraintEqualToAnchor(trailingAnchor),
            stackView.topAnchor.constraintEqualToAnchor(topAnchor),
            stackView.bottomAnchor.constraintEqualToAnchor(bottomAnchor)
        ])
    }
    
    public override var tintColor: UIColor!{
        didSet{
            emtyTitleLabel.textColor = tintColor
            emtyDescriptionLabel.textColor = tintColor
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}