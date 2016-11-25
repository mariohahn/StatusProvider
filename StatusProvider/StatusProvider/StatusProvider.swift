//
//  StatusProvider.swift
//
//  Created by MarioHahn on 23/08/16.
//

import Foundation
import UIKit

public enum StatusProviderType {
    case loading
    case status(Statusable)
}

public protocol Statusable {
    var title: String?          { get }
    var description: String?    { get }
    var actionTitle: String?    { get }
    var image: UIImage?         { get }
    var action: (() -> Void)?   { get }
}

extension Statusable {
    public var title: String? {
        return nil
    }
    
    public var description: String? {
        return nil
    }
    
    public var actionTitle: String? {
        return nil
    }
    
    public var image: UIImage? {
        return nil
    }
    
    public var action: (() -> Void)? {
        return nil
    }
}

public struct Status: Statusable {
    public var title: String?
    public var description: String?
    public var actionTitle: String?
    public var image: UIImage?
    public var action: (() -> Void)?
    
    public init(title: String? = nil, description: String? = nil, actionTitle: String? = nil, image: UIImage? = nil, action: (() -> Void)?) {
        self.title = title
        self.description = description
        self.actionTitle = actionTitle
        self.image = image
        self.action = action
    }
}

public protocol StatusDisplaying: class {
    var status: Statusable?  { set get }
    var view: UIView { get }
}

public protocol StatusOnViewProvider {
    var onView: StatusViewContainer { get }
}

public protocol StatusProvider: StatusOnViewProvider {
    
    var loadingView: UIView?                    { get }
    var statusView: StatusDisplaying?           { get }

    func show(statusType type: StatusProviderType)
}

extension StatusProvider {
    
    public var loadingView: UIView? {
        return LoadingView()
    }
    
    public var statusView: StatusDisplaying? {
        return StatusView()
    }
    
    public func show(statusType type: StatusProviderType) {
        switch type {
        case .loading:
            onView.currentView = loadingView
        case .status(let status):
            guard let sv = statusView else {
                fatalError("give me statusview oida")
            }
            
            sv.status = status
            onView.currentView = sv.view
        }
    }
}

extension StatusOnViewProvider where Self: UIView {
    
    public var onView: StatusViewContainer {
        return self
    }
}

extension StatusOnViewProvider where Self: UIViewController {
    
    public var onView: StatusViewContainer {
        return view
    }
}

extension StatusOnViewProvider where Self: UITableViewController {
    
    public var onView: StatusViewContainer {
        if let backgroundView = tableView.backgroundView {
            return backgroundView
        }
        return view
    }
}

public protocol StatusViewContainer: class {
    var currentView: UIView? { get set }
}

extension UIView: StatusViewContainer {
    public static let CurrentViewTag = 666
    
    public var currentView: UIView? {
        get {
            return viewWithTag(UIView.CurrentViewTag)
        }
        set {
            viewWithTag(UIView.CurrentViewTag)?.removeFromSuperview()
            
            guard let view = newValue else {
                return
            }
            
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.centerXAnchor.constraint(equalTo: centerXAnchor),
                view.centerYAnchor.constraint(equalTo: centerYAnchor),
                view.leadingAnchor.constraint(greaterThanOrEqualTo: readableContentGuide.leadingAnchor),
                view.trailingAnchor.constraint(lessThanOrEqualTo: readableContentGuide.trailingAnchor),
                view.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
                view.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
            ])
        }
    }
}
