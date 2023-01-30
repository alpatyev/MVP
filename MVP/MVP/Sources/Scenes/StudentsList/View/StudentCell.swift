//
//  StudentCell.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/29/23.
//

import UIKit

class StudentCell: UITableViewCell {
    
    static var id = "student cell"
    
    // MARK: - UI
    
    private var divider = UIScreen.main.bounds.width * 0.035

    private lazy var leftImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "person.crop.square.fill")
        imageView.roundedBorders()
        imageView.backgroundColor = .systemGray3.withAlphaComponent(0.5)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .thin)
        label.textAlignment = .left
        return label
    }()
        
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.roundedBorders()
        label.textAlignment = .center
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupHierarchy()
        updateLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeElements()
    }
    
    // MARK: - Get model data
    
    public func configure(with recieved: Student?) {
        guard let model = recieved else {
            return
        }
        if let imageExists = UIImage(named: model.image) {
            leftImage.image = imageExists
        }
        mainTitle.text = model.name
        subtitle.text = "\(model.score) 🏆"
    }
    
    // MARK: - Setups and updates UI
    
    private func removeElements() {
        leftImage.removeFromSuperview()
        mainTitle.removeFromSuperview()
        subtitle.removeFromSuperview()
    }
    
    private func setupHierarchy() {
        contentView.addSubview(leftImage)
        contentView.addSubview(mainTitle)
        contentView.addSubview(subtitle)
    }
    
    private func updateLayout() {
        setupImage()
        setupMainTitle()
        setupSubtitle()
    }
    
    private func setupImage() {
        leftImage.snp.makeConstraints { make in
            make.width.height.equalTo(contentView.snp.height).multipliedBy(0.8)
            make.left.equalTo(contentView).offset(divider)
            make.centerY.equalTo(contentView)
        }
    }
    
    private func setupMainTitle() {
        mainTitle.snp.makeConstraints { make in
            make.left.equalTo(leftImage.snp.right).offset(divider)
            make.height.equalTo(contentView).multipliedBy(0.8)
            make.centerY.equalTo(contentView)
            make.right.equalTo(subtitle.snp.left)
        }
    }
    
    private func setupSubtitle() {
        subtitle.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(4)
            make.height.equalTo(contentView).multipliedBy(0.8)
            make.right.equalTo(contentView).inset(divider)
            make.centerY.equalTo(contentView)
        }
    }
}
