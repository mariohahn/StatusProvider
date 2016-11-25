//
//  LoadingStatusView.swift
//  3MobileTV
//
//  Created by MarioHahn on 25/08/16.
//  Copyright © 2016 Hutchison Drei Austria GmbH. All rights reserved.
//

import Foundation
import UIKit

open class LoadingView: UIView {
	    
	open let activityIndicatorView: UIActivityIndicatorView = {
		$0.startAnimating()
        
		return $0
	}(UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge))
	
	open let titleLabel: UILabel = {
		$0.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
		$0.textColor = UIColor.black
		
		return $0
	}(UILabel())
	
	let stackView: UIStackView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.axis = .horizontal
		$0.spacing = 10
		
		return $0
	}(UIStackView())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(stackView)
		
		stackView.addArrangedSubview(activityIndicatorView)
		stackView.addArrangedSubview(titleLabel)
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	open override var tintColor: UIColor! {
		didSet {
			titleLabel.textColor = tintColor
			activityIndicatorView.color = tintColor
		}
	}
}
