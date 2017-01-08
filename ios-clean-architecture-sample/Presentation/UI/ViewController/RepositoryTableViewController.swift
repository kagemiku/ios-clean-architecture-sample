//
//  RepositoryTableViewController.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/4/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

class RepositoryTableViewController: UIViewController {
    fileprivate lazy var repositoryTableView: UITableView = self.createRepositoryTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(repositoryTableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.layoutRepositoryTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func createRepositoryTableView() -> UITableView {
        let tableView = UITableView(frame: CGRect.zero)
        return tableView
    }

    private func layoutRepositoryTableView() {
        let frame = self.view.frame
        self.repositoryTableView.frame = frame
    }
}

