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
        
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    override func setupProperties() {
        super.setupProperties()
        backgroundColor = .white
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        contentView.addSubview(songNameLabel)
    }

    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        
        songNameLabel.constrainEdges(to: self, insets: UIEdgeInsetsMake(0, 8, 0, 36))
    }
}
