//
//  UILayoutPriority.swift
//
//  Created by Sereivoan Yong on 1/14/20.
//

import UIKit

extension UILayoutPriority: ExpressibleByFloatLiteral {
  
  public typealias FloatLiteralType = Float
  
  public init(floatLiteral value: Float) {
    self.init(value)
  }
}

extension UILayoutPriority: ExpressibleByIntegerLiteral {
  
  public typealias IntegerLiteralType = Int
  
  public init(integerLiteral value: Int) {
    self.init(Float(value))
  }
}

extension UILayoutPriority {
  
  public static func == (lhs: UILayoutPriority, rhs: Float) -> Bool {
    return lhs.rawValue == rhs
  }
}
