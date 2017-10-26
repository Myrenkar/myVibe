//
//  UIKit.UIViewController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayError(withContent content: (title: String, message: String)) {
        if !(navigationController?.visibleViewController is UIAlertController) {
            handleError(title: content.title, message: content.message)
        }
    }
    
    func handleError(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.okAction())
        present(alertController, animated: true, completion: nil)
    }
}
