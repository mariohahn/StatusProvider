//
//  StatusProvider.swift
//
//  Created by MarioHahn on 23/08/16.
//

import Foundation
import UIKit


public enum StatusProviderType {
    
    struct Constants {
        static let loadingTag   = 7023
        static let errorTag     = 7024
        static let emtyTag      = 7025
        static let noneTag      = 7026
    }
    
    case Loading
    case Error(error: NSError?, retry: (()->Void)?)
    case Empty(action: (()->Void)?)
    case None
    
    static func allViewTags() -> [Int]{
        return [ Constants.loadingTag,Constants.errorTag,Constants.emtyTag,Constants.noneTag]
    }
    
    func viewTag() -> Int{
        switch self {
        case .Loading:    return  Constants.loadingTag
        case .Error(_,_): return  Constants.errorTag
        case .Empty(_):    return  Constants.emtyTag
        case .None:       return  Constants.noneTag
        }
    }
}

func == (lhs: StatusProviderType, rhs: StatusProviderType) -> Bool {
    switch (lhs, rhs) {
        case (.Loading, .Loading): return true
        case (.Empty(_), .Empty(_)): return true
        case (.None, .None): return true
        case let (.Error(error1, _), .Error(error2, _)) where error1 == error2:  return true
        default: return false
    }
}

public protocol StatusOnViewProvider {
    var onView: UIView { get }
}

public protocol StatusProvider: StatusOnViewProvider {
    
    var loadingView: UIView?                    { get }
    var errorView: ErrorStatusDisplaying?       { get }
    var emptyView: EmptyStatusDisplaying?        { get }

    func show(statusType type: StatusProviderType)
    func hide(statusType type: StatusProviderType)
}

extension StatusOnViewProvider where Self: UIViewController {
    
    public var onView: UIView {
        return view
    }
}

extension StatusOnViewProvider where Self: UITableViewController {
    
    public var onView: UIView {
        return view
    }
}

extension StatusOnViewProvider where Self: UIView {
    
    public var onView: UIView {
        return self
    }
}

public protocol EmptyStatusDisplaying: class {
    
    var action: (()->Void)?         { set get }
}

public protocol ErrorStatusDisplaying: class {
    
    var error: NSError?             { set get }
    var retry: (()->Void)?          { set get }
}

extension StatusProvider{
    
    
    public var loadingView: UIView? {
        get {
            #if os(tvOS)
                return LoadingStatusView(loadingStyle: .Activity)
            #elseif os(iOS)
                return LoadingStatusView(loadingStyle: .LabelWithActivity)
            #else
                return nil
            #endif
        }
    }
    
    public var errorView: ErrorStatusDisplaying? {
        get { return ErrorStatusView() }
    }
    
    public var emptyView: EmptyStatusDisplaying? {
        get { return nil }
    }
    
    public func hide(statusType type: StatusProviderType){
        remove(viewTag: type.viewTag())
    }
    
    func remove(viewTag tag: Int){
        onView.viewWithTag(tag)?.removeFromSuperview()
    }
    
    public func show(statusType type: StatusProviderType){
        
        StatusProviderType.allViewTags().forEach({ remove(viewTag: $0) })
        
        var statusView: UIView? = nil
        
        switch type {
        case let .Error(error,retry):
            
            statusView = errorView as? UIView
            (statusView as? ErrorStatusDisplaying)?.error = error
            (statusView as? ErrorStatusDisplaying)?.retry = retry
            
        case .Loading: statusView = loadingView
        case let .Empty(action):
            
            statusView = emptyView as? UIView
            (statusView as? EmptyStatusDisplaying)?.action = action
            
        case .None: break
        }
        
        statusView?.tag = type.viewTag()
        addViewAndCenterConstraints(statusView)
    }
    
    private func addViewAndCenterConstraints(view: UIView?){
        
        guard let view = view else { return }
        
        onView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
            view.centerXAnchor.constraintEqualToAnchor(onView.centerXAnchor),
            view.centerYAnchor.constraintEqualToAnchor(onView.centerYAnchor),
            view.leadingAnchor.constraintGreaterThanOrEqualToAnchor(onView.leadingAnchor),
            view.trailingAnchor.constraintLessThanOrEqualToAnchor(onView.trailingAnchor),
            view.topAnchor.constraintGreaterThanOrEqualToAnchor(onView.topAnchor),
            view.bottomAnchor.constraintLessThanOrEqualToAnchor(onView.bottomAnchor)
        ])
    }
}
