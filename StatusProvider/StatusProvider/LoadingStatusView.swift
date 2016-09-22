//
//  LoadingStatusView.swift
//  3MobileTV
//
//  Created by MarioHahn on 25/08/16.
//  Copyright © 2016 Hutchison Drei Austria GmbH. All rights reserved.
//

import Foundation
import UIKit

open class LoadingStatusView: UIView {
	
	public enum LoadingStatusStyle {
		case labelWithActivity
		case label
		case activity
	}
	
	open let activityIndicatorView: UIActivityIndicatorView = {
		$0.startAnimating()
		#if os(tvOS)
			$0.activityIndicatorViewStyle = .whiteLarge
		#elseif os(iOS)
			$0.activityIndicatorViewStyle = .gray
		#endif
		return $0
	}(UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge))
	
	open let loadingLabel: UILabel = {
		$0.text = "Loading…"
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
	
	var loadingStyle: LoadingStatusStyle = .labelWithActivity {
		didSet {
			adaptLoadingStyle()
		}
	}
	
	func adaptLoadingStyle() {
		loadingLabel.isHidden = false
		activityIndicatorView.isHidden = false
		
		switch loadingStyle {
		case .labelWithActivity:
			break
		case .label:
			activityIndicatorView.isHidden = true
		case .activity:
			loadingLabel.isHidden = true
		}
	}
	
	public convenience init(loadingStyle style: LoadingStatusStyle) {
		self.init(frame: CGRect.zero)
		
		loadingStyle = style
		adaptLoadingStyle()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(stackView)
		
		stackView.addArrangedSubview(activityIndicatorView)
		stackView.addArrangedSubview(loadingLabel)
		
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
			loadingLabel.textColor = tintColor
			activityIndicatorView.color = tintColor
		}
	}
}
