//
//  StudentCell.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/29/23.
//

import UIKit

class StudentCell: UITableViewCell {
    
    static var id = "student cell"
    
    private var divider = UIScreen.main.bounds.width * 0.035
    
    // MARK: - UI
    
    private lazy var leftImage: UIImageView = {
        let imageView = UIImageView()
        leftImage.backgroundColor = .systemGray3.withAlphaComponent(0.5)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
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
        removeElements()
        setupHierarchy()
        updateSubviews(frame)
    }
    
    // MARK: - Get model data
    
    public func configure(with recieved: Student?) {
        guard let model = recieved else {
            return
        }
        leftImage.image = UIImage.init(named: model.image)
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
    
    private func updateSubviews(_ frame: CGRect) {
        setupImage(frame)
        setupMainTitle()
        setupSubtitle()
    }
    
    private func setupImage(_ frame: CGRect) {
        let imageEdge = frame.height * 0.64
        imageView?.layer.cornerRadius = imageEdge / 2
        leftImage.snp.removeConstraints()
        leftImage.snp.makeConstraints { make in
            make.width.height.equalTo(imageEdge)
            make.left.equalTo(contentView).offset(divider)
            make.centerY.equalTo(contentView)
        }
    }
    
    private func setupMainTitle() {
        mainTitle.snp.makeConstraints { make in
            make.left.equalTo(leftImage.snp.right).offset(divider)
            make.right.equalTo(contentView)
            make.height.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
    }
    
    private func setupSubtitle() {
        subtitle.snp.makeConstraints { make in
            make.left.equalTo(leftImage.snp.right)
            make.right.equalTo(contentView).inset(divider / 2)
            make.height.equalTo(contentView)
            make.centerY.equalTo(contentView)
            
        }
    }
}
