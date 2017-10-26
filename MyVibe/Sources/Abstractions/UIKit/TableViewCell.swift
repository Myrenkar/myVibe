//
//  TableViewCell.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupProperties()
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    @available(*, unavailable, message: "Use init(style:reuseIdentifier) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Abstract
    /// Sets up the properties of `self`. Called automatically on `init(style:reuseIdentifier)`.
    func setupProperties() {
        // no-op by default
    }
    
    /// Sets up self views hierarchy and subviews in `self`. Called automatically on `init(style:reuseIdentifier)`.
    func setupViewHierarchy() {
        // no-op by default
    }
    
    /// Sets up layout in `self`. Called automatically on `init(style:reuseIdentifier)`.
    func setupLayoutConstraints() {
        // no-op by default
    }
}

extension TableViewCell: Reusable {}

