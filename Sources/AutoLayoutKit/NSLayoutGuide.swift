//
//  NSLayoutGuide.swift
//
//  Created by Sereivoan Yong on 1/2/20.
//

import UIKit

// MARK: - XAxis

public protocol NSLayoutXAxisEdgeGuide {
  
  var leftAnchor: NSLayoutXAxisAnchor { get }
  var rightAnchor: NSLayoutXAxisAnchor { get }
}

extension NSLayoutXAxisEdgeGuide {
  
  public var horizontalAnchors: NSLayoutXAxisEdgeAnchors {
    return .init(left: leftAnchor, right: rightAnchor)
  }
}

public protocol NSLayoutXAxisGuide: NSLayoutXAxisEdgeGuide {
  
  var widthAnchor: NSLayoutDimension { get }
  var centerXAnchor: NSLayoutXAxisAnchor { get }
  var superLayoutGuide: NSLayoutGuide? { get }
}

// MARK: - YAxis

public protocol NSLayoutYAxisEdgeGuide {
  
  var topAnchor: NSLayoutYAxisAnchor { get }
  var bottomAnchor: NSLayoutYAxisAnchor { get }
}

extension NSLayoutYAxisEdgeGuide {
  
  public var verticalAnchors: NSLayoutYAxisEdgeAnchors {
    return .init(top: topAnchor, bottom: bottomAnchor)
  }
}

public protocol NSLayoutYAxisGuide: NSLayoutYAxisEdgeGuide {
  
  var heightAnchor: NSLayoutDimension { get }
  var centerYAnchor: NSLayoutYAxisAnchor { get }
  var superLayoutGuide: NSLayoutGuide? { get }
}

// MARK: - Axis

public typealias NSLayoutAnchorEdgeGuide = NSLayoutXAxisEdgeGuide & NSLayoutYAxisEdgeGuide
// public typealias NSLayoutGuide = NSLayoutXAxisGuide & NSLayoutYAxisGuide
public protocol NSLayoutGuide: NSLayoutXAxisGuide, NSLayoutYAxisGuide { }

extension NSLayoutGuide {
  
  public var anchors: NSLayoutEdgeAnchors {
    return .init(horizontal: horizontalAnchors, veritcal: verticalAnchors)
  }
}

extension UIView: NSLayoutGuide {
  
  public var superLayoutGuide: NSLayoutGuide? {
    return superview
  }
}

extension UILayoutGuide: NSLayoutGuide {
  
  public var superLayoutGuide: NSLayoutGuide? {
    return owningView
  }
}

public func == (lhs: NSLayoutXAxisEdgeAnchors, rhs: NSLayoutXAxisEdgeAnchors) -> NSLayoutXAxisEdgeConstraints {
  return .init(left: lhs.left == rhs.left, right: rhs.right == lhs.right)
}

public func == (lhs: NSLayoutYAxisEdgeAnchors, rhs: NSLayoutYAxisEdgeAnchors) -> NSLayoutYAxisEdgeConstraints {
  return .init(top: lhs.top == rhs.top, bottom: rhs.bottom == lhs.bottom)
}

public func == (lhs: NSLayoutEdgeAnchors, rhs: NSLayoutEdgeAnchors) -> NSLayoutEdgeConstraints {
  return .init(horizontal: lhs.horizontal == rhs.horizontal, vertical: lhs.veritcal == rhs.veritcal)
}

public struct NSLayoutEdgeAnchors {
  
  public var horizontal: NSLayoutXAxisEdgeAnchors
  public var veritcal: NSLayoutYAxisEdgeAnchors
}
