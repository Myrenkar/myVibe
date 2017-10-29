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
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var tableViewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = .localized("artist.members.title")
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
        
        [profileLabel, tableView, tableViewTitleLabel].forEach(scrollView.addSubview)
        addSubview(scrollView)
    }
    
    override func setupLayoutConstraints() {
        super.setupLayoutConstraints()
        scrollView.constrainEdges(to: self)
        
        NSLayoutConstraint.activate([
            profileLabel.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor, constant: 8),
            profileLabel.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor),
            profileLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            
            tableViewTitleLabel.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor, constant: 8),
            tableViewTitleLabel.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor),
            tableViewTitleLabel.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 16),
            
            tableView.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: tableViewTitleLabel.bottomAnchor, constant: 16),
            tableView.heightAnchor.constraint(equalToConstant: 180),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
