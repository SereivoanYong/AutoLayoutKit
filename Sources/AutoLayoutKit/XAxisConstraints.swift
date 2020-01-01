//
//  XAxisConstraints.swift
//  
//
//  Created by Sereivoan Yong on 1/2/20.
//

import UIKit

public struct XAxisConstraints<Guide>: AxisConstraints where Guide: NSLayoutXAxisEdgeGuide {
  
  public let guide: Guide
  public let constraints: [NSLayoutConstraint]
  
  init(_ guide: Guide, constraints: [NSLayoutConstraint]) {
    self.guide = guide
    self.constraints = constraints
  }
  
  func next<Guide>(_ guide: Guide, constraints: NSLayoutConstraint...) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisEdgeGuide {
    return .init(guide, constraints: self.constraints + constraints)
  }
  
  /// Return horizontal spacing constraint. `h:...-8-[view]`
  public func spacing<Guide>(_ constant: CGFloat,
                             to nextGuide: Guide) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisEdgeGuide {
    return next(nextGuide, constraints: nextGuide.leftAnchor.constraint(equalTo: guide.rightAnchor, constant: constant))
  }
  
  /// Returns width and horizontal spacing constraints. `h:...-constant-[view(==widthConstant)]`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public func spacing<Guide>(_ constant: CGFloat,
                             to nextGuide: Guide,
                             _ widthConstraintProvider: (NSLayoutDimension, CGFloat) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:constant:),
                             _ widthConstant: CGFloat) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisGuide {
    return next(nextGuide, constraints:
      widthConstraintProvider(nextGuide.widthAnchor, widthConstant),
      nextGuide.leftAnchor.constraint(equalTo: guide.rightAnchor, constant: constant)
    )
  }
  
  /// Returns width and horizontal spacing constraints. `h:...-constant-[view(==anotherView*multiplier)]`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public func spacing<Guide>(_ constant: CGFloat,
                             to nextGuide: Guide,
                             _ widthConstraintProvider: (NSLayoutDimension, NSLayoutDimension.Attributes) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:attributes:),
                             _ otherAttribute: NSLayoutDimension.Attributes) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisGuide {
    return next(nextGuide, constraints:
      widthConstraintProvider(nextGuide.widthAnchor, otherAttribute),
      nextGuide.leftAnchor.constraint(equalTo: guide.rightAnchor, constant: constant)
    )
  }
  
  /// Returns width and horizontal spacing constraints. `h:...-constant-[view(==anotherView)]`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public func spacing<Guide>(_ constant: CGFloat,
                             to nextGuide: Guide,
                             _ widthConstraintProvider: (NSLayoutDimension, NSLayoutDimension.Attributes) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:attributes:),
                             _ anotherGuide: Guide) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisGuide {
    return spacing(constant, to: nextGuide, widthConstraintProvider, NSLayoutDimension.Attributes(dimension: anotherGuide.widthAnchor))
  }
}

extension XAxisConstraints where Guide: NSLayoutXAxisGuide {
  
  /// Returns horizontal spacing-to-super constraint. `h:...[view]-constant-|`
  public func spacingSuper(_ constant: CGFloat) -> XAxisConstraints<Guide> {
    return next(guide, constraints: guide.superLayoutGuide!.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: constant))
  }
}

extension NSLayoutConstraint {
  
  /// Returns horizontal spacing-to-super constraint. `v:|-constant-[view]...`
  public static func hSuperSpacing<Guide>(_ constant: CGFloat, _ guide: Guide) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisGuide {
    return .init(guide, constraints: [guide.leftAnchor.constraint(equalTo: guide.superLayoutGuide!.leftAnchor, constant: constant)])
  }
  
  /// Returns empty horizontal constraints. `v:[view]...`
  public static func h<Guide>(_ guide: Guide) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisEdgeGuide {
    return .init(guide, constraints: [])
  }
  
  /// Returns width constraint. `h:[view(==50)]...`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public static func h<Guide>(_ guide: Guide,
                              _ widthConstraintProvider: (NSLayoutDimension, CGFloat) -> NSLayoutConstraint,
                              _ widthConstant: CGFloat) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisGuide {
    return .init(guide, constraints: [widthConstraintProvider(guide.widthAnchor, widthConstant)])
  }
  
  /// Returns width constraint. `h:[view(==anotherView)]`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public static func h<Guide>(_ guide: Guide,
                              _ widthConstraintProvider: (NSLayoutDimension, NSLayoutDimension.Attributes) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:attributes:),
                              _ anotherGuide: NSLayoutXAxisGuide) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisGuide {
    return .init(guide, constraints: [widthConstraintProvider(guide.widthAnchor, NSLayoutDimension.Attributes(dimension: anotherGuide.widthAnchor))])
  }
  
  /// Returns width and horizontal spacing constraints. `h:...-constant-[view(==anotherView*multiplier)]`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public static func h<Guide>(_ guide: Guide,
                             _ widthConstraintProvider: (NSLayoutDimension, NSLayoutDimension.Attributes) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:attributes:),
                             _ otherAttribute: NSLayoutDimension.Attributes) -> XAxisConstraints<Guide> where Guide: NSLayoutXAxisGuide {
    return .init(guide, constraints: [widthConstraintProvider(guide.widthAnchor, otherAttribute)])
  }
}
