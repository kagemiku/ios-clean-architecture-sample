//
//  GitHubRepositoryTableViewCell.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/8/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit
import Kingfisher

final class GitHubRepositoryTableViewCell: UITableViewCell {
    static let contentViewPadding: CGFloat = 5

    fileprivate lazy var avatarImageView: UIImageView = self.createAvatarImageView()
    fileprivate lazy var repositoryNameLabel: UILabel = self.createRepositoryNameLabel()
    fileprivate lazy var separatorView: UIView        = self.createSeparatorView()

    private var avatarImageViewHeight: CGFloat {
        return self.contentView.frame.height - GitHubRepositoryTableViewCell.contentViewPadding * 2.0
    }

    private var repositoryNameLabelWidth: CGFloat {
        return self.contentView.frame.size.width - self.avatarImageViewHeight - GitHubRepositoryTableViewCell.contentViewPadding * 3.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.repositoryNameLabel)
        self.contentView.addSubview(self.separatorView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.layoutAvatarImageView()
        self.layoutRepositoryNameLabel()
        self.layoutSeparatorView()
    }

    override func prepareForReuse() {
        self.avatarImageView.image = nil
    }

    private func createAvatarImageView() -> UIImageView {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.backgroundColor = UIColor.white

        return imageView
    }

    private func createRepositoryNameLabel() -> UILabel {
        let label = UILabel(frame: CGRect.zero)

        return label
    }

    private func createSeparatorView() -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(hex: 0xE8E8E8)

        return view
    }

    private func layoutAvatarImageView() {
        let frame = CGRect(x: GitHubRepositoryTableViewCell.contentViewPadding,
                           y: GitHubRepositoryTableViewCell.contentViewPadding,
                           width: self.avatarImageViewHeight,
                           height: self.avatarImageViewHeight)
        self.avatarImageView.frame = frame
    }

    private func layoutRepositoryNameLabel() {
        let frame = CGRect(x: self.avatarImageView.frame.size.width + GitHubRepositoryTableViewCell.contentViewPadding * 2.0,
                           y: GitHubRepositoryTableViewCell.contentViewPadding,
                           width: self.repositoryNameLabelWidth,
                           height: self.avatarImageViewHeight)
        self.repositoryNameLabel.frame = frame
    }

    private func layoutSeparatorView() {
        let frame = CGRect(x: GitHubRepositoryTableViewCell.contentViewPadding,
                           y: self.contentView.frame.size.height - 1.0,
                           width: self.contentView.frame.size.width - GitHubRepositoryTableViewCell.contentViewPadding,
                           height: 1)
        self.separatorView.frame = frame
    }

    func configure(_ model: GitHubRepositoryModel) {
        self.repositoryNameLabel.text = model.fullName
        if let url = URL(string: model.owner.avatarURLString) {
            self.avatarImageView.kf.setImage(with: url)
        }
    }
}
