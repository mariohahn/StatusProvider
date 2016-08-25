//
//  EmtyStatusView.swift
//  3MobileTV
//
//  Created by MarioHahn on 25/08/16.
//  Copyright © 2016 Hutchison Drei Austria GmbH. All rights reserved.
//

import Foundation
import UIKit

public class EmtyStatusView: UIView {
    
    let emtyTitleLabel: UILabel = {
        $0.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        $0.textColor = UIColor.whiteColor()
        $0.textAlignment = .Center
        
        return $0
    }(UILabel())
    
    let emtyDescriptionLabel: UILabel = {
        $0.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
        $0.textColor = UIColor.whiteColor()
        $0.textAlignment = .Center
        $0.numberOfLines = 0
        
        return $0
    }(UILabel())
    
    let emtyImageView: UIImageView = {
        
        return $0
    }(UIImageView())
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .Vertical
        $0.spacing = 10
        
        return $0
    }(UIStackView())
    
    public convenience init(title: String?, caption: String?, image: UIImage? = nil){
        self.init(frame: CGRectZero)
        
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
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(emtyImageView)
        stackView.addArrangedSubview(emtyTitleLabel)
        stackView.addArrangedSubview(emtyDescriptionLabel)
        
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