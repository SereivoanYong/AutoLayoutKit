//
//  NSLayoutDimension+ConstraintProvider.swift
//
//  Created by Sereivoan Yong on 1/2/20.
//

import UIKit

extension NSLayoutDimension {
  
  // MARK: - Provider using another dimension
  
  @inlinable public static func equal(dimension: NSLayoutDimension, attributes: Attributes) -> NSLayoutConstraint {
    return dimension.constraint(equalTo: attributes.dimension, multiplier: attributes.multiplier)
  }
  
  @inlinable public static func greaterThanOrEqual(dimension: NSLayoutDimension, attributes: Attributes) -> NSLayoutConstraint {
    return dimension.constraint(greaterThanOrEqualTo: attributes.dimension, multiplier: attributes.multiplier)
  }
  
  @inlinable public static func lessThanOrEqual(dimension: NSLayoutDimension, attributes: Attributes) -> NSLayoutConstraint {
    return dimension.constraint(lessThanOrEqualTo: attributes.dimension, multiplier: attributes.multiplier)
  }
  
  // MARK: - Provider using constant
  
  @inlinable public static func equal(dimension: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    return dimension.constraint(equalToConstant: constant)
  }
  
  @inlinable public static func greaterThanOrEqual(dimension: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    return dimension.constraint(greaterThanOrEqualToConstant: constant)
  }
  
  @inlinable public static func lessThanOrEqual(dimension: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    return dimension.constraint(lessThanOrEqualToConstant: constant)
  }
  
  // MARK: - Operator provider using another dimension
  
  /// `anchor == otherAnchor`
  /// - returns: `anchor.constraint(equalTo: otherAnchor)`
  @inlinable public static func == (dimension: NSLayoutDimension, otherDimension: NSLayoutDimension) -> NSLayoutConstraint {
    return equal(dimension: dimension, attributes: Attributes(dimension: otherDimension, multiplier: 1))
  }
  
  /// `anchor >= otherAnchor`
  /// - returns: `anchor.constraint(greaterThanOrEqualTo: otherAnchor)`
  @inlinable public static func >= (dimension: NSLayoutDimension, otherDimension: NSLayoutDimension) -> NSLayoutConstraint {
    return greaterThanOrEqual(dimension: dimension, attributes: Attributes(dimension: otherDimension, multiplier: 1))
  }
  
  /// `anchor <= otherAnchor`
  /// - returns: `anchor.constraint(lessThanOrEqualTo: otherAnchor)`
  @inlinable public static func <= (dimension: NSLayoutDimension, otherDimension: NSLayoutDimension) -> NSLayoutConstraint {
    return lessThanOrEqual(dimension: dimension, attributes: Attributes(dimension: otherDimension, multiplier: 1))
  }
  
  /// `anchor == otherAnchor * multiplier`
  /// - returns: `anchor.constraint(equalTo: otherAnchor, multiplier: multiplier)`
  @inlinable public static func == (dimension: NSLayoutDimension, attributes: Attributes) -> NSLayoutConstraint {
    return equal(dimension: dimension, attributes: attributes)
  }
  
  /// `anchor >= otherAnchor * multiplier`
  /// - returns: `anchor.constraint(greaterThanOrEqualTo: otherAnchor, multiplier: multiplier)`
  @inlinable public static func >= (dimension: NSLayoutDimension, attributes: Attributes) -> NSLayoutConstraint {
    return greaterThanOrEqual(dimension: dimension, attributes: attributes)
  }
  
  /// `anchor <= otherAnchor * multiplier`
  /// - returns: `anchor.constraint(lessThanOrEqualTo: otherAnchor, multiplier: multiplier)`
  @inlinable public static func <= (dimension: NSLayoutDimension, attributes: Attributes) -> NSLayoutConstraint {
    return lessThanOrEqual(dimension: dimension, attributes: attributes)
  }
  
  // MARK: - Operator provider using constant
  
  /// `anchor == constant`
  /// - returns: `anchor.constraint(equalToConstant: constant)`
  @inlinable public static func == (dimension: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    return equal(dimension: dimension, constant: constant)
  }
  
  /// `anchor >= constant`
  /// - returns: `anchor.constraint(greaterThanOrEqualToConstant: constant)`
  @inlinable public static func >= (dimension: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    return greaterThanOrEqual(dimension: dimension, constant: constant)
  }
  
  /// `anchor <= constant`
  /// - returns: `anchor.constraint(lessThanOrEqualToConstant: constant)`
  @inlinable public static func <= (dimension: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
    return lessThanOrEqual(dimension: dimension, constant: constant)
  }
  
  public struct Attributes {
    
    public let dimension: NSLayoutDimension
    public let multiplier: CGFloat
    
    public init(dimension: NSLayoutDimension, multiplier: CGFloat = 1) {
      self.dimension = dimension
      self.multiplier = multiplier
    }
  }
  
  public static func * (dimension: NSLayoutDimension, multiplier: CGFloat) -> Attributes {
    return Attributes(dimension: dimension, multiplier: multiplier)
  }
}
