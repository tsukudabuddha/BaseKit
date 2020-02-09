//
//  Extensions.swift
//  BaseKit
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import UIKit

public extension UIView {
  
  func addSubviews(_ views: [UIView]) {
    for view in views {
      addSubview(view)
    }
  }
  
  func makePinToSuperviewConstraints() -> [NSLayoutConstraint] {
    guard let _ = superview else { return [] }
    let views = [
        "view": self
    ]
    return NSLayoutConstraint.constraints(withVisualFormats: [
        "H:|[view]|",
        "V:|[view]|"
    ], options: [], metrics: nil, views: views)
  }

  func pinToSuperview() {
    translatesAutoresizingMaskIntoConstraints = false
    makePinToSuperviewConstraints().activate()
  }
}

public extension Array where Element == NSLayoutConstraint {
  func activate() {
    for constraint in self {
      constraint.isActive = true
    }
  }
}

public extension Array where Element == UIView {
  func disableAutoresizing() {
    for view in self {
      view.translatesAutoresizingMaskIntoConstraints = false
    }
  }
}

public extension UIStackView {
  func addArrangedSubviews(_ views: [UIView]) {
    for view in views {
      addArrangedSubview(view)
    }
  }
}

// MARK: Hide Keyboard when tap
public extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

public extension NSLayoutConstraint {
    static func constraints(withVisualFormats vfls: [String], options: NSLayoutConstraint.FormatOptions, metrics: [String : Any]?, views: [String : Any]) -> [NSLayoutConstraint] {
        return vfls.flatMap { return NSLayoutConstraint.constraints(withVisualFormat: $0, options: options, metrics: metrics, views: views) }
    }
}

