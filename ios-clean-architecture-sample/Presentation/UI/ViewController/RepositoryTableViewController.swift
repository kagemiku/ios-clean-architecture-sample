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

    fileprivate var presenter: RepositoryPresenter? = nil
    fileprivate var repositories: [RepositoryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupRepositries()
        self.view.addSubview(repositoryTableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load", style: .plain, target: self, action: #selector(self.loadRepositories(sender:)))

        self.layoutRepositoryTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func inject(presenter: RepositoryPresenter) {
        self.presenter = presenter
    }

    private func createRepositoryTableView() -> UITableView {
        let tableView = UITableView(frame: CGRect.zero)
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.cellIdentifier)
        return tableView
    }

    private func layoutRepositoryTableView() {
        let frame = self.view.frame
        self.repositoryTableView.frame = frame
    }

    // TODO: Test Code
    private func setupRepositries() {
        repositories.append(RepositoryModel(repositoryName: "Test1"))
        repositories.append(RepositoryModel(repositoryName: "Test2"))
        repositories.append(RepositoryModel(repositoryName: "Test3"))
    }

    // TODO: Test Code
    func loadRepositories(sender: AnyObject) {
        presenter?.loadRepositories(repositoryName: "")
    }
}

// MARK: - UITableViewDataSource
extension RepositoryTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.cellIdentifier, for: indexPath)
        if let repositoryTableViewCell = cell as? RepositoryTableViewCell {
            repositoryTableViewCell.configure(repositories[indexPath.row])
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension RepositoryTableViewController: UITableViewDelegate { }


// MARK: - RepositoryPresenterDelegate
extension RepositoryTableViewController: RepositoryPresenterInputDelegate {
    func setRepositoriesModel(_ repositoriesModel: RepositoriesModel) {
        self.repositories = repositoriesModel.repositories
        self.repositoryTableView.reloadData()
    }
}
