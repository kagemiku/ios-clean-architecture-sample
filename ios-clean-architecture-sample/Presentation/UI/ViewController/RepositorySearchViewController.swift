//
//  RepositorySearchViewController.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/4/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

class RepositorySearchViewController: UIViewController {
    fileprivate lazy var repositoryTableView: UITableView = {
        let tableViewFrame = self.view.frame
        let tableView = UITableView(frame: tableViewFrame)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(repositoryTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

