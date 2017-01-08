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

    fileprivate var presenter: GitHubRepositoryPresenter? = nil
    fileprivate var repositories: [GitHubRepositoryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupRepositries()
        self.view.addSubview(repositoryTableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load", style: .plain, target: self, action: #selector(self.loadRepositories(sender:)))

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

    private func layoutGitHubRepositoryTableView() {
        let frame = self.view.frame
        self.repositoryTableView.frame = frame
    }

    // TODO: Test Code
    private func setupRepositries() {
        repositories.append(GitHubRepositoryModel(repositoryName: "Test1"))
        repositories.append(GitHubRepositoryModel(repositoryName: "Test2"))
        repositories.append(GitHubRepositoryModel(repositoryName: "Test3"))
    }

    // TODO: Test Code
    func loadRepositories(sender: AnyObject) {
        presenter?.loadRepositories(repositoryName: "")
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


// MARK: - GitHubRepositoryPresenterDelegate
extension GitHubRepositoryTableViewController: GitHubRepositoryPresenterInputDelegate {
    func setRepositoriesModel(_ repositoriesModel: RepositoriesModel) {
        self.repositories = repositoriesModel.repositories
        self.repositoryTableView.reloadData()
    }
}
