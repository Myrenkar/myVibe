//
//  View.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

/// An abstract superclass for views which aims to reduce boilerplate among subclasses
class View: UIView {
    
    // MARK: Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        setupViewHierarchy()
        setupProperties()
        setupLayoutConstraints()
    }
    
    // MARK: Overrides
    
    override static var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    // MARK: methods
    
    /// Sets up the view hierarchy of `self`. Called automatically on `init()`
    func setupViewHierarchy() {}
    
    /// Sets up layout constraints in `self`. Called automatically on `init()`
    func setupLayoutConstraints() {}
    
    /// Sets up the views properties of `self`. Called automatically on `init()`
    func setupProperties() {}
    
    // MARK: Unavailable
    
    /// - SeeAlso: NSCoding.init?(coder:)
    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
