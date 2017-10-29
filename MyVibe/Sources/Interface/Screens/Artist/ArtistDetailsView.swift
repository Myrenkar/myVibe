//
//  ArtistDetailsView.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 29/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class ArtistDetailsView: View {
    private(set) lazy var profileLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        return scrollView
    }()
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        
        [profileLabel].forEach(scrollView.addSubview)
        addSubview(scrollView)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        scrollView.constrainEdges(to: self)
        
        NSLayoutConstraint.activate([
            profileLabel.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor, constant: 8),
            profileLabel.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor),
            profileLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 72),
            profileLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
