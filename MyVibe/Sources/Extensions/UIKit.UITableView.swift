//
//  UIKit.UITableView.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerClass<CellType: UITableViewCell>(_ type: CellType.Type) where CellType: Reusable {
        register(type, forCellReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeue<CellType: UITableViewCell>() -> CellType where CellType: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: CellType.reuseIdentifier) as? CellType else {
            fatalError("Could not dequeue cell of type \(CellType.self) with reuseIdentifier \(CellType.reuseIdentifier)")
        }
        return cell
    }
    
    func registerHeaderFooterClass<ViewType: UITableViewHeaderFooterView>(_ type: ViewType.Type) where ViewType: Reusable {
        register(type, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }
    
    func dequeue<ViewType: UITableViewHeaderFooterView>() -> ViewType where ViewType: Reusable {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: ViewType.reuseIdentifier) as? ViewType else {
            fatalError("Could not dequeue cell of type \(ViewType.self) with reuseIdentifier \(ViewType.reuseIdentifier)")
        }
        return cell
    }
}
