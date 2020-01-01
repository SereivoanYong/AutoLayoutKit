//
//  YAxisConstraints.swift
//  
//
//  Created by Sereivoan Yong on 1/2/20.
//

import UIKit

public struct YAxisConstraints<Guide>: AxisConstraints where Guide: NSLayoutYAxisEdgeGuide {
  
  public let guide: Guide
  public let constraints: [NSLayoutConstraint]
  
  init(_ guide: Guide, constraints: [NSLayoutConstraint]) {
    self.guide = guide
    self.constraints = constraints
  }
  
  func next<Guide>(_ guide: Guide, constraints: NSLayoutConstraint...) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisEdgeGuide {
    return .init(guide, constraints: self.constraints + constraints)
  }
  
  /// Return vertical spacing constraint. `v:...-8-[view]`
  public func spacing<Guide>(_ constant: CGFloat,
                             to nextGuide: Guide) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisEdgeGuide {
    return next(nextGuide, constraints: nextGuide.topAnchor.constraint(equalTo: guide.bottomAnchor, constant: constant))
  }
  
  /// Returns height and vertical spacing constraints. `v:...-constant-[view(==heightConstant)]`
  /// - Parameters:
  ///   - heightConstraintProvider: `==`, ` >=`, `<=`
  public func spacing<Guide>(_ constant: CGFloat,
                             to nextGuide: Guide,
                             _ heightConstraintProvider: (NSLayoutDimension, CGFloat) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:constant:),
                             _ heightConstant: CGFloat) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisGuide {
    return next(nextGuide, constraints:
      heightConstraintProvider(nextGuide.heightAnchor, heightConstant),
      nextGuide.topAnchor.constraint(equalTo: guide.bottomAnchor, constant: constant)
    )
  }
  
  /// Returns width and horizontal spacing constraints. `h:...-constant-[view(==anotherView*multiplier)]`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public func spacing<Guide>(_ constant: CGFloat,
                             to nextGuide: Guide,
                             _ heightConstraintProvider: (NSLayoutDimension, NSLayoutDimension.Attributes) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:attributes:),
                             _ otherAttribute: NSLayoutDimension.Attributes) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisGuide {
    return next(nextGuide, constraints:
      heightConstraintProvider(nextGuide.heightAnchor, otherAttribute),
      nextGuide.topAnchor.constraint(equalTo: guide.bottomAnchor, constant: constant)
    )
  }
  
  /// Returns height and vertical spacing constraints. `v:...-constant-[view(==anotherView)]`
  /// - Parameters:
  ///   - heightConstraintProvider: `==`, ` >=`, `<=`
  public func spacing<Guide>(_ constant: CGFloat,
                             to nextGuide: Guide,
                             _ heightConstraintProvider: (NSLayoutDimension, NSLayoutDimension.Attributes) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:attributes:),
                             _ anotherGuide: Guide) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisGuide {
    return spacing(constant, to: nextGuide, heightConstraintProvider, NSLayoutDimension.Attributes(dimension: anotherGuide.heightAnchor))
  }
}

extension YAxisConstraints where Guide: NSLayoutYAxisGuide {
  
  /// Returns vertical spacing-to-super constraint. `v:...[view]-constant-|`
  public func spacingSuper(_ constant: CGFloat) -> YAxisConstraints<Guide> {
    return next(guide, constraints: guide.superLayoutGuide!.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: constant))
  }
}

extension NSLayoutConstraint {
  
  /// Returns vertical spacing-to-super constraint. `v:|-constant-[view]...`
  public static func vSuperSpacing<Guide>(_ constant: CGFloat, _ guide: Guide) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisGuide {
    return .init(guide, constraints: [guide.topAnchor.constraint(equalTo: guide.superLayoutGuide!.topAnchor, constant: constant)])
  }
  
  /// Returns empty vertical constraints. `v:[view]...`
  public static func v<Guide>(_ guide: Guide) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisEdgeGuide {
    return .init(guide, constraints: [])
  }
  
  /// Returns height constraint. `v:[view(==50)]...`
  /// - Parameters:
  ///   - heightConstraintProvider: `==`, ` >=`, `<=`
  public static func v<Guide>(_ guide: Guide,
                              _ heightConstraintProvider: (NSLayoutDimension, CGFloat) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:constant:),
                              _ heightConstant: CGFloat) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisGuide {
    return .init(guide, constraints: [heightConstraintProvider(guide.heightAnchor, heightConstant)])
  }
  
  /// Returns height constraint. `v:[view(==anotherView)]`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public static func v<Guide>(_ guide: Guide,
                              _ heightConstraintProvider: (NSLayoutDimension, NSLayoutDimension.Attributes) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:attributes:),
                              _ anotherGuide: NSLayoutYAxisGuide) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisGuide {
    return .init(guide, constraints: [heightConstraintProvider(guide.heightAnchor, NSLayoutDimension.Attributes(dimension: anotherGuide.heightAnchor))])
  }
  
  /// Returns height and vertical spacing constraints. `h:...-constant-[view(==anotherView*multiplier)]`
  /// - Parameters:
  ///   - widthConstraintProvider: `==`, ` >=`, `<=`
  public static func v<Guide>(_ guide: Guide,
                             _ heightConstraintProvider: (NSLayoutDimension, NSLayoutDimension.Attributes) -> NSLayoutConstraint = NSLayoutDimension.equal(dimension:attributes:),
                             _ otherAttribute: NSLayoutDimension.Attributes) -> YAxisConstraints<Guide> where Guide: NSLayoutYAxisGuide {
    return .init(guide, constraints: [heightConstraintProvider(guide.heightAnchor, otherAttribute)])
  }
}
