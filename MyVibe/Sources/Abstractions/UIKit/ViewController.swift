//
//  ViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

class ViewController<ViewType: UIView>: UIViewController {
    
    // MARK: Initializers
    
    init(view makeCustomView: @escaping @autoclosure () -> ViewType) {
        self.makeCustomView = makeCustomView
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: Properties
    
    private let makeCustomView: () -> ViewType
    
    private(set) lazy var customView: ViewType = self.makeCustomView()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperties()
        setupNavigationItem()
    }
    
    override func loadView() {
        
        super.loadView()
        
        view.addSubview(customView)
        customView.constrainEdges(to: view)
    }
    
    // MARK: Setup
    
    /// Set up properties of `self`. Called automatically on `viewDidLoad`
    func setupProperties() {}
    
    /// Set up navigation item in `self`. Called automatically on `viewDidLoad`
    func setupNavigationItem() {}
    
    // MARK: Unavailable
    
    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("Implementation unavailable")
    }
    
}
