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
    fileprivate lazy var headerView: GitHubRepositoryDetailHeaderView = self.createHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.detailTableView)
        self.layoutHeaderView()
        self.detailTableView.tableHeaderView = self.headerView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.layoutDetailTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.detailTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func createDetailTableView() -> UITableView {
        let tableView = UITableView(frame: CGRect.zero)

        return tableView
    }

    private func createHeaderView() -> GitHubRepositoryDetailHeaderView {
        let headerView = GitHubRepositoryDetailHeaderView(frame: CGRect.zero)
        headerView.update(repositoryName: "text", watchersNumber: 0, starsNumber: 0, forksNumber: 0)

        return headerView
    }

    private func layoutDetailTableView() {
        let frame = self.view.frame
        self.detailTableView.frame = frame
    }

    private func layoutHeaderView() {
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 100.0)
        self.headerView.frame = frame
    }
}
