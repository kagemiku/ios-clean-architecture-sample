//
//  GitHubRepositoryDetailHeaderView.swift
//  ios-clean-architecture-sample
//
//  Created by Akira Fukunaga on 1/10/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailHeaderView: UIView {
    static let labelViewMargin: CGFloat = 10.0

    fileprivate lazy var repositoryNameLabel: UILabel = self.createRepositoryNameLabel()
    fileprivate lazy var watchLabelView: GitHubRepositoryDetailHeaderLabelView = self.createWatchLabelView()
    fileprivate lazy var starLabelView: GitHubRepositoryDetailHeaderLabelView  = self.createStarLabelView()
    fileprivate lazy var forkLabelView: GitHubRepositoryDetailHeaderLabelView  = self.createForkLabelView()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    private func commonInit() {
        self.addSubview(self.repositoryNameLabel)
        self.addSubview(self.watchLabelView)
        self.addSubview(self.starLabelView)
        self.addSubview(self.forkLabelView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.layoutRepositoryNameLabel()
        self.layoutWatchLabelView()
        self.layoutStarLabelView()
        self.layoutForkLabelView()
    }

    private func createRepositoryNameLabel() -> UILabel {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont(name: "Futura-Medium", size: 30.0)
        label.textColor = UIColor(hex: 0x4983C7)
        label.textAlignment = .center

        return label
    }

    private func createWatchLabelView() -> GitHubRepositoryDetailHeaderLabelView {
        let labelView = GitHubRepositoryDetailHeaderLabelView(frame: CGRect.zero)
        labelView.update(title: "Watch")

        return labelView
    }

    private func createStarLabelView() -> GitHubRepositoryDetailHeaderLabelView {
        let labelView = GitHubRepositoryDetailHeaderLabelView(frame: CGRect.zero)
        labelView.update(title: "Star")

        return labelView
    }

    private func createForkLabelView() -> GitHubRepositoryDetailHeaderLabelView {
        let labelView = GitHubRepositoryDetailHeaderLabelView(frame: CGRect.zero)
        labelView.update(title: "Fork")

        return labelView
    }

    private func layoutRepositoryNameLabel() {
        let height = self.frame.size.height / 2.0
        let frame = CGRect(x: 0,
                           y: 0,
                           width: self.frame.width,
                           height: height)
        self.repositoryNameLabel.frame = frame
    }

    private func layoutWatchLabelView() {
        let width = (self.frame.size.width - GitHubRepositoryDetailHeaderView.labelViewMargin * 4.0) / 3.0
        let height = self.frame.size.height / 3.0
        let frame = CGRect(x: GitHubRepositoryDetailHeaderView.labelViewMargin,
                           y: self.frame.size.height * 2.0 / 3.0,
                           width: width,
                           height: height)
        self.watchLabelView.frame = frame
    }

    private func layoutStarLabelView() {
        let width = (self.frame.size.width - GitHubRepositoryDetailHeaderView.labelViewMargin * 4.0) / 3.0
        let height = self.frame.size.height / 3.0
        let frame = CGRect(x: GitHubRepositoryDetailHeaderView.labelViewMargin * 2.0 + width,
                           y: self.frame.size.height * 2.0 / 3.0,
                           width: width,
                           height: height)
        self.starLabelView.frame = frame
    }

    private func layoutForkLabelView() {
        let width = (self.frame.size.width - GitHubRepositoryDetailHeaderView.labelViewMargin * 4.0) / 3.0
        let height = self.frame.size.height / 3.0
        let frame = CGRect(x: GitHubRepositoryDetailHeaderView.labelViewMargin * 3.0 + width * 2.0,
                           y: self.frame.size.height * 2.0 / 3.0,
                           width: width,
                           height: height)
        self.forkLabelView.frame = frame
    }

    func update(repositoryName: String? = nil, watchersNumber: Int? = nil, starsNumber: Int? = nil, forksNumber: Int? = nil) {
        if let r = repositoryName {
            self.repositoryNameLabel.text = r
        }

        self.watchLabelView.update(number: watchersNumber)
        self.starLabelView.update(number: starsNumber)
        self.forkLabelView.update(number: forksNumber)
    }
}
