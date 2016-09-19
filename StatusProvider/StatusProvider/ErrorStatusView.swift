//
//  ErrorStatusView.swift
//
//  Created by MarioHahn on 25/08/16.
//

import Foundation
import UIKit

open class ErrorStatusView: UIView, ErrorStatusDisplaying {
	
	open var retry: (() -> Void)? {
		didSet {
			guard let _ = retry else { return }
			
			errorActionButton.isHidden = false
		}
	}
	
	open var error: NSError? {
		didSet {
			
			guard let error = error else { return }
			
			errorDescriptionLabel.text = error.localizedDescription
		}
	}
	
	open let errorTitleLabel: UILabel = {
		$0.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
		$0.textColor = UIColor.black
		$0.textAlignment = .center
		$0.text = "Error"
		
		return $0
	}(UILabel())
	
	open let errorDescriptionLabel: UILabel = {
		$0.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption2)
		$0.textColor = UIColor.black
		
		return $0
	}(UILabel())
	
	open let errorActionButton: UIButton = {
		$0.setTitle("Retry", for: .normal)
		$0.isHidden = true
		
		return $0
	}(UIButton(type: UIButtonType.system))
	
	let stackView: UIStackView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.axis = .vertical
		$0.spacing = 10
		
		return $0
	}(UIStackView())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		errorActionButton.addTarget(self, action: #selector(ErrorStatusView.errorButtonAction), for: .primaryActionTriggered)
		
		addSubview(stackView)
		
		stackView.addArrangedSubview(errorTitleLabel)
		stackView.addArrangedSubview(errorDescriptionLabel)
		stackView.addArrangedSubview(errorActionButton)
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	func errorButtonAction() {
		retry?()
	}
	
	open override var tintColor: UIColor! {
		didSet {
			errorTitleLabel.textColor = tintColor
			errorDescriptionLabel.textColor = tintColor
		}
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
