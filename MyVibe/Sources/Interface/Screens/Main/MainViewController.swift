//
//  MainViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

final class MainViewController: ViewController<MainView> {
    
    private let dependencies: ApplicationDependenciesProvider
    
    init(dependencies: ApplicationDependenciesProvider) {
        self.dependencies = dependencies
        super.init(view: MainView())
    }
}
