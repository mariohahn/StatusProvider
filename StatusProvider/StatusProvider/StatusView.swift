//
//  EmptyStatusView
//
//  Created by MarioHahn on 25/08/16.
//

import Foundation
import UIKit

open class StatusView: UIView, StatusDisplaying {
    public var view: UIView {
        return self
    }
    
    public var status: Statusable? {
        didSet {
            imageView.image = status?.image
            titleLabel.text = status?.title
            descriptionLabel.text = status?.description
            actionButton.setTitle(status?.actionTitle, for: UIControlState())
        }
    }
    
    open let imageView: UIImageView = {
        $0.contentMode = .center
        
        return $0
    }(UIImageView())
	
	open let titleLabel: UILabel = {
		$0.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
		$0.textColor = UIColor.black
		$0.textAlignment = .center
		
		return $0
	}(UILabel())
	
	open let descriptionLabel: UILabel = {
		$0.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption2)
		$0.textColor = UIColor.black
		$0.textAlignment = .center
		$0.numberOfLines = 0
		
		return $0
	}(UILabel())
    
    let actionButton: UIButton = {
        
        return $0
    }(UIButton(type: .system))
	
	let stackView: UIStackView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.axis = .vertical
		$0.spacing = 10
		
		return $0
	}(UIStackView())
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(stackView)
		
		stackView.addArrangedSubview(imageView)
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(descriptionLabel)
		stackView.addArrangedSubview(actionButton)
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	open override var tintColor: UIColor! {
		didSet {
			titleLabel.textColor = tintColor
			descriptionLabel.textColor = tintColor
		}
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
