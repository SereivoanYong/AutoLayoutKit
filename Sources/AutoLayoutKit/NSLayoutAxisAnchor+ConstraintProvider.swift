//
//  NSLayoutAxisAnchor+ConstraintProvider.swift
//
//  Created by Sereivoan Yong on 1/2/20.
//

import UIKit

extension NSLayoutAnchor {
  
  public struct AxisAttributes {
    
    public let anchor: AnchorType
    public let constant: CGFloat
  }
}

/* This does not work
@inlinable public func == <AnchorType>(anchor: NSLayoutAnchor<AnchorType>, otherAnchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint where AnchorType: AnyObject {
  return anchor.constraint(equalTo: otherAnchor)
}
*/

extension NSLayoutXAxisAnchor {
  
  /// `anchor == otherAnchor`
  /// - returns: `anchor.constraint(equalTo: otherAnchor)`
  @inlinable public static func == (anchor: NSLayoutXAxisAnchor, otherAnchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    return anchor.constraint(equalTo: otherAnchor)
  }
  
  /// `anchor >= otherAnchor`
  /// - returns: `anchor.constraint(greaterThanOrEqualTo: otherAnchor)`
  @inlinable public static func >= (anchor: NSLayoutXAxisAnchor, otherAnchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    return anchor.constraint(greaterThanOrEqualTo: otherAnchor)
  }
  
  /// `anchor <= otherAnchor`
  /// - returns: `anchor.constraint(lessThanOrEqualTo: otherAnchor)`
  @inlinable public static func <= (anchor: NSLayoutXAxisAnchor, otherAnchor: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    return anchor.constraint(lessThanOrEqualTo: otherAnchor)
  }
  
  /// `anchor == otherAnchor + constant`
  /// - returns: `anchor.constraint(equalTo: otherAnchor, constant: constant)`
  @inlinable public static func == (anchor: NSLayoutXAxisAnchor, attributes: AxisAttributes) -> NSLayoutConstraint {
    return anchor.constraint(equalTo: attributes.anchor, constant: attributes.constant)
  }
  
  /// `anchor >= otherAnchor + constant`
  /// - returns: `anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)`
  @inlinable public static func >= (anchor: NSLayoutXAxisAnchor, attributes: AxisAttributes) -> NSLayoutConstraint {
    return anchor.constraint(greaterThanOrEqualTo: attributes.anchor, constant: attributes.constant)
  }
  
  /// `anchor <= otherAnchor + constant`
  /// - returns: `anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant)`
  @inlinable public static func <= (anchor: NSLayoutXAxisAnchor, attributes: AxisAttributes) -> NSLayoutConstraint {
    return anchor.constraint(lessThanOrEqualTo: attributes.anchor, constant: attributes.constant)
  }
  
  public static func + (anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> AxisAttributes {
    return AxisAttributes(anchor: anchor, constant: constant)
  }
  
  public static func - (anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> AxisAttributes {
    return AxisAttributes(anchor: anchor, constant: -constant)
  }
}

extension NSLayoutYAxisAnchor {
  
  /// `anchor == otherAnchor`
  /// - returns: `anchor.constraint(equalTo: otherAnchor)`
  @inlinable public static func == (anchor: NSLayoutYAxisAnchor, otherAnchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    return anchor.constraint(equalTo: otherAnchor)
  }
  
  /// `anchor >= otherAnchor`
  /// - returns: `anchor.constraint(greaterThanOrEqualTo: otherAnchor)`
  @inlinable public static func >= (anchor: NSLayoutYAxisAnchor, otherAnchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    return anchor.constraint(greaterThanOrEqualTo: otherAnchor)
  }
  
  /// `anchor <= otherAnchor`
  /// - returns: `anchor.constraint(lessThanOrEqualTo: otherAnchor)`
  @inlinable public static func <= (anchor: NSLayoutYAxisAnchor, otherAnchor: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    return anchor.constraint(lessThanOrEqualTo: otherAnchor)
  }
  
  /// `anchor == otherAnchor + constant`
  /// - returns: `anchor.constraint(equalTo: otherAnchor, constant: constant)`
  @inlinable public static func == (anchor: NSLayoutYAxisAnchor, attributes: AxisAttributes) -> NSLayoutConstraint {
    return anchor.constraint(equalTo: attributes.anchor, constant: attributes.constant)
  }
  
  /// `anchor >= otherAnchor + constant`
  /// - returns: `anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)`
  @inlinable public static func >= (anchor: NSLayoutYAxisAnchor, attributes: AxisAttributes) -> NSLayoutConstraint {
    return anchor.constraint(greaterThanOrEqualTo: attributes.anchor, constant: attributes.constant)
  }
  
  /// `anchor <= otherAnchor + constant`
  /// - returns: `anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant)`
  @inlinable public static func <= (anchor: NSLayoutYAxisAnchor, attributes: AxisAttributes) -> NSLayoutConstraint {
    return anchor.constraint(lessThanOrEqualTo: attributes.anchor, constant: attributes.constant)
  }
  
  public static func + (anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> AxisAttributes {
    return AxisAttributes(anchor: anchor, constant: constant)
  }
  
  public static func - (anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> AxisAttributes {
    return AxisAttributes(anchor: anchor, constant: -constant)
  }
}
