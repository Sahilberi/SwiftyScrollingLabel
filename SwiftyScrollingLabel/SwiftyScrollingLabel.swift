//
//  SwiftyScrollingLabel.swift
//  DemoLabel
//
//  Created by Sahil on 27/04/17.
//  Copyright © 2017 SahilBeri. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class SwiftyScrollingLabel: UIView {

  var label: UILabel!
  
  @IBInspectable var labelScrollingSpeed: Double = 10.0 {
    didSet {
      
    }
  }
  
  @IBInspectable var right: Bool = false {
    didSet {
      // do something here
    }
  }
  
  @IBInspectable var labelBgColor: UIColor = .yellow {
    didSet {
      label.backgroundColor = labelBgColor
      self.backgroundColor = labelBgColor
    }
  }
  
  @IBInspectable var labelText: String = "" {
    didSet {
      label.text = labelText
    }
  }

  public override init(frame: CGRect) {
    super.init(frame: frame)
    updateView()
 }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    updateView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()

    label.translatesAutoresizingMaskIntoConstraints = false
    self.addConstraint(label, toView: self, attribute: .top, constant: 0.0)
    self.addConstraint(label, toView: self, attribute: .leading, constant: 0.0)
    self.addConstraint(label, toView: self, attribute: .bottom, constant: 0.0)
    label.textColor = UIColor.black
  }

  func updateView() {
    self.clipsToBounds = true
    label = UILabel()
    self.addSubview(label)
  }
  
  func startAnimate() {
    if self.right {
      // for right to left
      rightAnim()
    } else {
      // for left to right
        leftAnim()
    }
  }

  private func rightAnim(){
    self.layoutIfNeeded()

    // for right to left
    self.label.frame.origin.x = self.label.frame.width
  
    UIView.animate(withDuration: labelScrollingSpeed, delay: 0, options: ([.curveLinear, .repeat]), animations: {() -> Void in
        self.label.frame.origin.x = -self.label.frame.width
      }, completion:  { _ in})
  }

  private func leftAnim() {
    self.label.frame.origin.x = -self.label.frame.width

    UIView.animate(withDuration: labelScrollingSpeed, delay: 0, options: ([.curveLinear, .repeat]), animations: {() -> Void in
      self.label.frame.origin.x = self.frame.width
    }, completion:  { _ in })
  }

  func addConstraint(_ newView: UIView, toView: UIView, attribute: NSLayoutAttribute, constant: CGFloat) {
    let constraint =  NSLayoutConstraint(item: newView, attribute: attribute, relatedBy: .equal, toItem: toView, attribute: attribute, multiplier: 1.0, constant: constant)
    toView.addConstraint(constraint)
  }
  
  func addConstantHeightConstraint(_ newView: UIView, constant: CGFloat) {
    let constraint =  NSLayoutConstraint(item: newView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: constant)
    newView.addConstraint(constraint)
  }
  
}

