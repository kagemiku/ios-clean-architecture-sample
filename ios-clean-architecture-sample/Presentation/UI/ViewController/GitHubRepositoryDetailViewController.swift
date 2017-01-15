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
    fileprivate var repository: GitHubRepositoryModel? {
        didSet {
            guard let repo = self.repository else {
                return
            }

            self.headerView.update(repositoryName: repo.name,
                                   watchersNumber: repo.watchersCount,
                                   starsNumber: repo.stargazersCount,
                                   forksNumber: repo.forksCount)

            self.presenter?.setupDataSource(model: repo)
        }
    }

    fileprivate var presenter: GitHubRepositoryDetailPresenter? = nil
    fileprivate var dataSource: [GitHubRepositoryDetailModel] = []

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

    func inject(presenter: GitHubRepositoryDetailPresenter) {
        self.presenter = presenter
    }

    private func createDetailTableView() -> UITableView {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.register(GitHubRepositoryDetailViewCell.self, forCellReuseIdentifier: GitHubRepositoryDetailViewCell.cellIdentifier)

        return tableView
    }

    private func createHeaderView() -> GitHubRepositoryDetailHeaderView {
        let headerView = GitHubRepositoryDetailHeaderView(frame: CGRect.zero)
        headerView.backgroundColor = UIColor(hex: 0xFBFBFB)
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

    func setRepositoryModel(_ repositoryModel: GitHubRepositoryModel) {
        self.repository = repositoryModel
    }
}

// MARK: - UITableViewDataSource
extension GitHubRepositoryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GitHubRepositoryDetailViewCell.cellIdentifier, for: indexPath)
        if let c = cell as? GitHubRepositoryDetailViewCell,
            let data = dataSource[safe: indexPath.row] {
            switch data {
            case .Description(let text):
                c.configure(text: text, icon: nil)
            case .Owner(let model):
                c.configure(text: model.name, icon: nil)
                break
            }
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension GitHubRepositoryDetailViewController: UITableViewDelegate { }

// MARK: -
extension GitHubRepositoryDetailViewController: GitHubRepositoryDetailPresenterInput {
    func setDataSource(_ dataSource: [GitHubRepositoryDetailModel]) {
        self.dataSource = dataSource
        self.detailTableView.reloadData()
    }
}
