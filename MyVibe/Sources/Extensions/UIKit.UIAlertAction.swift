//
//  UIKit.UIAlertAction.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

extension UIAlertAction {
    static func okAction(handler: ((UIAlertAction) -> Swift.Void)? = nil) -> UIAlertAction {
        return UIAlertAction(
            title: .localized("ui_alert_action.ok"),
            style: .default,
            handler: handler
        )
    }
}
