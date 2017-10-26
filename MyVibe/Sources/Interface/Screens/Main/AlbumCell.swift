//
//  AlbumCell.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class AlbumCell: TableViewCell {
    lazy var songNameLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    override func setupProperties() {
        super.setupProperties()
        backgroundColor = .blue
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        contentView.addSubview(songNameLabel)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        
        songNameLabel.constrainEdges(to: self)
    }
}
