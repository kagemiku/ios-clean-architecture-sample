//
//  GitHubRepositoryTableViewController.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/4/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

class GitHubRepositoryTableViewController: UIViewController {
    fileprivate lazy var repositoryTableView: UITableView = self.createRepositoryTableView()
    fileprivate lazy var repositorySearchController: UISearchController = self.createRepositorySearchController()

    fileprivate var presenter: GitHubRepositoryPresenter? = nil
    fileprivate var repositories: [GitHubRepositoryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(repositoryTableView)
        self.repositoryTableView.tableHeaderView = self.repositorySearchController.searchBar
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.layoutGitHubRepositoryTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func inject(presenter: GitHubRepositoryPresenter) {
        self.presenter = presenter
    }

    private func createRepositoryTableView() -> UITableView {
        let tableView = UITableView(frame: CGRect.zero)
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.register(GitHubRepositoryTableViewCell.self, forCellReuseIdentifier: GitHubRepositoryTableViewCell.cellIdentifier)

        return tableView
    }

    private func createRepositorySearchController() -> UISearchController {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation     = false
        searchController.hidesNavigationBarDuringPresentation = false

        return searchController
    }

    private func layoutGitHubRepositoryTableView() {
        let frame = self.view.frame
        self.repositoryTableView.frame = frame
    }
}

// MARK: - UITableViewDataSource
extension GitHubRepositoryTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GitHubRepositoryTableViewCell.cellIdentifier, for: indexPath)
        if let c = cell as? GitHubRepositoryTableViewCell {
            c.configure(repositories[indexPath.row])
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension GitHubRepositoryTableViewController: UITableViewDelegate { }

// MARK: - UISearchResultsUpdating
extension GitHubRepositoryTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.presenter?.didUpdateRepositorySearchBarText(searchController.searchBar.text)
    }
}

// MARK: - GitHubRepositoryPresenterDelegate
extension GitHubRepositoryTableViewController: GitHubRepositoryPresenterInput {
    func setRepositoriesModel(_ repositoriesModel: RepositoriesModel) {
        self.repositories = repositoriesModel.repositories
        self.repositoryTableView.reloadData()
    }
}
