//
//  GitHubRepositoryTableViewController.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/4/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

final class GitHubRepositoryTableViewController: UIViewController {
    fileprivate lazy var repositoryTableView: UITableView = self.createRepositoryTableView()
    fileprivate lazy var repositorySearchBar: UISearchBar = self.createRepositorySearchBar()
    fileprivate lazy var loadingView: UIActivityIndicatorView = self.createLoadingView()

    fileprivate var presenter: GitHubRepositoryPresenter? = nil
    fileprivate var repositories: [GitHubRepositoryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Repository Searcher"
        self.view.addSubview(self.repositoryTableView)
        self.repositoryTableView.tableHeaderView = self.repositorySearchBar
        self.view.addSubview(self.loadingView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.layoutGitHubRepositoryTableView()
        self.layoutRepositorySearchBar()
        self.layoutLoadingView()
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
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.register(GitHubRepositoryTableViewCell.self, forCellReuseIdentifier: GitHubRepositoryTableViewCell.cellIdentifier)

        return tableView
    }

    private func createRepositorySearchBar() -> UISearchBar {
        let searchBar = UISearchBar(frame: CGRect.zero)
        searchBar.placeholder = "Search"
        searchBar.delegate = self

        return searchBar
    }

    private func createLoadingView() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect.zero)
        activityIndicatorView.activityIndicatorViewStyle = .gray
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.isHidden = true

        return activityIndicatorView
    }

    private func layoutGitHubRepositoryTableView() {
        let frame = self.view.bounds
        self.repositoryTableView.frame = frame
    }

    private func layoutRepositorySearchBar() {
        let frame = CGRect(x: 0, y: 0, width: self.repositoryTableView.frame.size.width, height: 50)
        self.repositorySearchBar.frame = frame
    }

    private func layoutLoadingView() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.loadingView.frame = frame
        self.loadingView.center = self.repositoryTableView.center
    }
}

// MARK: - UITableViewDataSource
extension GitHubRepositoryTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GitHubRepositoryTableViewCell.cellIdentifier, for: indexPath)
        if let c = cell as? GitHubRepositoryTableViewCell {
            c.configure(self.repositories[indexPath.row])
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension GitHubRepositoryTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let repository = self.repositories[indexPath.row]
        self.presenter?.didSelectRepository(repositoryModel: repository)
    }
}

// MARK: - UISearchBarDelegate
extension GitHubRepositoryTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.presenter?.didTapSearchButton(text: searchBar.text)
    }
}

// MARK: - GitHubRepositoryPresenterDelegate
extension GitHubRepositoryTableViewController: GitHubRepositoryPresenterInput {
    func setRepositoriesModel(_ repositoriesModel: GitHubRepositoriesModel) {
        self.repositories = repositoriesModel.repositories
        self.repositoryTableView.reloadData()
    }

    func endSearching() {
        self.repositorySearchBar.resignFirstResponder()
    }

    func showLoadingView() {
        self.loadingView.startAnimating()
    }

    func hideLoadingView() {
        self.loadingView.stopAnimating()
    }
}
