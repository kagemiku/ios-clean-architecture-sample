//
//  GitHubRepositoryDetailHeaderLabelView.swift
//  ios-clean-architecture-sample
//
//  Created by Akira Fukunaga on 1/10/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

final class GitHubRepositoryDetailHeaderLabelView: UIView {
    fileprivate lazy var contentView: UIView  = self.createContentView()
    fileprivate lazy var upperView: UIView    = self.createUpperView()
    fileprivate lazy var lowerView: UIView    = self.createLowerView()
    fileprivate lazy var titleLabel: UILabel  = self.createTitleLabel()
    fileprivate lazy var numberLabel: UILabel = self.createNumberLabel()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.contentView)
        self.contentView.addSubview(self.upperView)
        self.contentView.addSubview(self.lowerView)
        self.upperView.addSubview(self.titleLabel)
        self.lowerView.addSubview(self.numberLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.layoutContentView()
        self.layoutUpperView()
        self.layoutLowerView()
        self.layoutTitleLabel()
        self.layoutNumberLabel()
    }

    private func createContentView() -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.layer.borderColor = UIColor(hex: 0xDADADA).cgColor
        view.layer.borderWidth = 1.0

        return view
    }

    private func createUpperView() -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(hex: 0xF0F0F0)
        view.layer.borderColor = UIColor(hex: 0xDADADA).cgColor
        view.layer.borderWidth = 1.0

        return view
    }

    private func createLowerView() -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .white

        return view
    }

    private func createTitleLabel() -> UILabel {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont(name: "Futura-Medium", size: 10.0)
        label.textColor = UIColor(hex: 0x585858)
        label.textAlignment = .center

        return label
    }

    private func createNumberLabel() -> UILabel {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont(name: "Futura-Medium", size: 10.0)
        label.textColor = UIColor(hex: 0x585858)
        label.textAlignment = .center

        return label
    }

    private func layoutContentView() {
        let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.contentView.frame = frame
    }

    private func layoutUpperView() {
        let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height / 2.0)
        self.upperView.frame = frame
    }

    private func layoutLowerView() {
        let frame = CGRect(x: 0, y: self.frame.size.height / 2.0, width: self.frame.size.width, height: self.frame.size.height / 2.0)
        self.lowerView.frame = frame
    }

    private func layoutTitleLabel() {
        let frame = CGRect(x: 0, y: 0, width: self.upperView.frame.size.width, height: self.upperView.frame.size.height)
        self.titleLabel.frame = frame
    }

    private func layoutNumberLabel() {
        let frame = CGRect(x: 0, y: 0, width: self.lowerView.frame.size.width, height: self.lowerView.frame.size.height)
        self.numberLabel.frame = frame
    }
}

// MARK: - Public Method
extension GitHubRepositoryDetailHeaderLabelView {
    func update(title: String? = nil, number: Int? = nil) {
        if let t = title {
            self.titleLabel.text = t
        }

        if let n = number {
            self.numberLabel.text = String(n)
        }
    }
}
