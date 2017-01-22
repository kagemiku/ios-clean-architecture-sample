//
//  Wireframe.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/14/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

protocol WireFrame {
    associatedtype ViewController: UIViewController

    init(viewController: ViewController)
}
