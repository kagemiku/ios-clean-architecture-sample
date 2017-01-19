//
//  UITableViewCellExtension.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/20/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}
