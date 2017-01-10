//
//  GitHubRepositoryDetailViewController.swift
//  ios-clean-architecture-sample
//
//  Created by Akira Fukunaga on 1/10/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailViewController: UIViewController {
    fileprivate lazy var detailTableView: UITableView = self.createDetailTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.detailTableView) 
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.layoutDetailTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func createDetailTableView() -> UITableView {
        let tableView = UITableView(frame: CGRect.zero)
        return tableView
    }

    private func layoutDetailTableView() {
        let frame = self.view.bounds
        self.detailTableView.frame = frame
    }
}
