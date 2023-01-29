//
//  StudentView.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit
import SnapKit

class StudentView: UIView {
    
    // MARK: - UI
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemRed
        label.textColor = Constants.Colors.lightText
        label.text = "0"
        label.textAlignment = .center
        label.font = Constants.Fonts.headers
        label.layer.cornerRadius = 18
        label.clipsToBounds = true
        label.sizeToFit()
        return label
    }()
        
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = Constants.Colors.primary
        imageView.image = UIImage(named: "unknownStudentIcon")
        imageView.sizeToFit()
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.headers
        label.textAlignment = .center
        label.text = "Студент"
        label.sizeToFit()
        return label
    }()
    
    private lazy var teamLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.description
        label.textAlignment = .center
        label.text = "Команда"
        label.sizeToFit()
        return label
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image.layer.cornerRadius = image.frame.height / 2
        image.layer.borderColor = Constants.Colors.primary.cgColor
        image.layer.borderWidth = 3
    }
    
    // MARK: - Configure with student model
    
    public func configure(with data: Student?) {
        guard let student = data else {
            return
        }
        if let profileImage = UIImage(named: student.image) {
            image.image = profileImage
        }
        scoreLabel.text = "\(student.score)"
        nameLabel.text = student.name
        teamLabel.text = "✨ \(student.team) 🏅"
    }
    
    // MARK: - Setups
    
    private func setupView() {
        backgroundColor = Constants.Colors.background.withAlphaComponent(0.75)
    }
    
    private func setupHierarchy() {
        addSubview(image)
        addSubview(scoreLabel)
        addSubview(nameLabel)
        addSubview(teamLabel)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.width.height.equalTo(self.snp.height).dividedBy(2)
            make.centerX.equalTo(scoreLabel)
            make.top.equalToSuperview().offset(Constants.Layout.paging / 2)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.width.equalTo(image)
            make.height.equalToSuperview().dividedBy(4)
            make.left.equalToSuperview().offset(Constants.Layout.paging)
            make.top.equalTo(image.snp.bottom).offset(Constants.Layout.paging / 4)
        }
    
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(scoreLabel.snp.right).offset(Constants.Layout.paging)
            make.centerY.equalTo(image)
            make.height.equalTo(scoreLabel)
            make.right.equalToSuperview().inset(Constants.Layout.paging / 2)
        }
        
        teamLabel.snp.makeConstraints { make in
            make.left.equalTo(scoreLabel.snp.right).offset(Constants.Layout.paging)
            make.height.centerY.equalTo(scoreLabel)
            make.right.equalToSuperview().inset(Constants.Layout.paging / 2)
        }
    }
}
