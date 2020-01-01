//
//  NSEdges.swift
//
//  Created by Sereivoan Yong on 1/3/20.
//

import UIKit

public struct NSXAxisEdges<Item> {
  
  public var left, right: Item
  
  public init(left: Item, right: Item) {
    self.left = left
    self.right = right
  }
  
  public var array: [Item] {
    return [left, right]
  }
}

public struct NSYAxisEdges<Item> {
  
  public var top, bottom: Item
  
  public init(top: Item, bottom: Item) {
    self.top = top
    self.bottom = bottom
  }
  
  public var array: [Item] {
    return [top, bottom]
  }
}

public struct NSEdges<Item> {
  
  public var top, left, bottom, right: Item
  
  public init(top: Item, left: Item, bottom: Item, right: Item) {
    self.top = top
    self.left = left
    self.bottom = bottom
    self.right = right
  }
  
  public init(horizontal: NSXAxisEdges<Item>, vertical: NSYAxisEdges<Item>) {
    self.init(top: vertical.top, left: horizontal.left, bottom: vertical.bottom, right: horizontal.right)
  }
  
  public var array: [Item] {
    return [top, left, bottom, right]
  }
  
  public func map<T>(_ transform: (Item) -> T) -> NSEdges<T> {
    return NSEdges<T>(top: transform(top), left: transform(left), bottom: transform(bottom), right: transform(right))
  }
  
  public mutating func apply<T>(_ edges: NSEdges<T>, set: (inout Item, T) -> Void) {
    set(&top, edges.top)
    set(&left, edges.left)
    set(&bottom, edges.bottom)
    set(&right, edges.right)
  }
}

public typealias NSEdgeInsets = NSEdges<CGFloat>

public typealias NSLayoutXAxisEdgeAnchors = NSXAxisEdges<NSLayoutXAxisAnchor>
public typealias NSLayoutYAxisEdgeAnchors = NSYAxisEdges<NSLayoutYAxisAnchor>

public typealias NSLayoutXAxisEdgeConstraints = NSXAxisEdges<NSLayoutConstraint>
public typealias NSLayoutYAxisEdgeConstraints = NSYAxisEdges<NSLayoutConstraint>
public typealias NSLayoutEdgeConstraints = NSEdges<NSLayoutConstraint>

extension NSLayoutEdgeConstraints {
  
  public var constants: NSEdgeInsets {
    get { return map({ $0.constant }) }
    set { apply(newValue) { $0.constant = $1 } }
  }
}

public protocol _ConstraintsConvertible {
  
  var array: [NSLayoutConstraint] { get }
}

extension NSLayoutXAxisEdgeConstraints: _ConstraintsConvertible { }
extension NSLayoutYAxisEdgeConstraints: _ConstraintsConvertible { }
extension NSLayoutEdgeConstraints: _ConstraintsConvertible { }

extension Array: _ConstraintsConvertible where Element == NSLayoutConstraint {
  
  public var array: [NSLayoutConstraint] {
    return self
  }
}

extension NSLayoutConstraint {
  
  public static func activate(_ constraints: _ConstraintsConvertible...) {
    activate(constraints.reduce(into: [NSLayoutConstraint](), { $0.append(contentsOf: $1.array) }))
  }
}
