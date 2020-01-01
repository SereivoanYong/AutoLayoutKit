//
//  AxisConstraints.swift
//
//  Created by Sereivoan Yong on 1/2/20.
//

import UIKit

public protocol AxisConstraints {
  
  associatedtype Guide
  var guide: Guide { get }
  var constraints: [NSLayoutConstraint] { get }
}

extension AxisConstraints {
  
  public func activate() {
    NSLayoutConstraint.activate(constraints)
  }
}
