//
//  EmptyStatusView
//
//  Created by MarioHahn on 25/08/16.
//

import Foundation
import UIKit

open class EmptyStatusView: UIView, EmptyStatusDisplaying {
	
	open var action: (() -> Void)? {
		didSet {
			guard let _ = action else { return }
			
			emtyActionButton.isHidden = false
		}
	}
	
	let emtyActionButton: UIButton = {
		$0.isHidden = true
		return $0
	}(UIButton(type: .system))
	
	open let emtyTitleLabel: UILabel = {
		$0.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
		$0.textColor = UIColor.black
		$0.textAlignment = .center
		
		return $0
	}(UILabel())
	
	open let emtyDescriptionLabel: UILabel = {
		$0.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption2)
		$0.textColor = UIColor.black
		$0.textAlignment = .center
		$0.numberOfLines = 0
		
		return $0
	}(UILabel())
	
	open let emtyImageView: UIImageView = {
		$0.contentMode = .center
		
		return $0
	}(UIImageView())
	
	let stackView: UIStackView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.axis = .vertical
		$0.spacing = 10
		
		return $0
	}(UIStackView())
	
	public convenience init(title: String?, caption: String?, image: UIImage? = nil, actionTitle: String? = nil) {
		self.init(frame: CGRect.zero)
		
		emtyActionButton.addTarget(self, action: #selector(EmptyStatusView.emtyButtonAction), for: .primaryActionTriggered)
		
		if let title = title , title.characters.count > 0 {
			emtyTitleLabel.text = title
		} else {
			emtyTitleLabel.isHidden = true
		}
		
		if let caption = caption , caption.characters.count > 0 {
			emtyDescriptionLabel.text = caption
		} else {
			emtyDescriptionLabel.isHidden = true
		}
		
		if let image = image {
			emtyImageView.image = image
		} else {
			emtyImageView.isHidden = true
		}
		
		if let actionTitle = actionTitle , actionTitle.characters.count > 0 {
			emtyActionButton.setTitle(actionTitle, for: UIControlState())
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
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	open override var tintColor: UIColor! {
		didSet {
			emtyTitleLabel.textColor = tintColor
			emtyDescriptionLabel.textColor = tintColor
		}
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
