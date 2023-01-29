//
//  DetailViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController, DetailViewProtocol {
    
    // MARK: - UI
    
    private lazy var backgroundView: UIView = {
        let veiw = UIView()
        veiw.backgroundColor = Constants.Colors.primary
        veiw.layer.cornerRadius = 12
        return veiw
    }()
    
    private lazy var detailView: UIView = {
        let veiw = UIView()
        veiw.backgroundColor = .white
        veiw.layer.borderColor = UIColor.gray.cgColor
        veiw.layer.borderWidth = 1
        veiw.layer.cornerRadius = 12
        veiw.clipsToBounds = true
        return veiw
    }()
    
    private lazy var stackViewScore: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 15
        [self.studentScore,
         self.studentScoreDate].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    private lazy var stackViewTeam: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 15
        [self.studentTeam,
         self.studentTeamDate].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    private lazy var stackViewHW: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 15
        [self.studentHWPassed,
         self.studentHWPassedDate].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    private lazy var messageView: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.borderWidth = 1
        label.layer.borderColor = Constants.Colors.primary.cgColor
        label.layer.cornerRadius = 12
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var studentName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .white
        label.text = "studentName"
        return label
    }()
    
    private lazy var studentTeam: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.text = "Team"
        return label
    }()

    private lazy var studentScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.text = "Score"
        
        return label
    }()
    
    private lazy var studentHWPassed: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.text = "HWPassed"
        return label
    }()
    
    private lazy var studentTeamDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
        label.textColor = .gray
        label.text = "TeamDate"
        return label
    }()

    private lazy var studentScoreDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
        label.textColor = .gray
        label.text = "ScoreDate"
        return label
    }()
    
    private lazy var studentHWPassedDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
        label.textColor = .gray
        label.text = "HWPassedDate"
        return label
    }()
    
    private lazy var studentMessage: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 15.0)
    label.textColor = .white
    label.text = "studentMessage"
    return label
}()
    
    private lazy var studentIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "courseLogo")
        imageView.roundedBorders(.white, 1, 10)
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    
    // MARK: - Presenter

    var presenter: DetailPresenterProtocol
    
    // MARK: - Lifecycle
    
    init(with presenter: DetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = presenter.model.name
        view.backgroundColor = Constants.Colors.background
        navigationController?.navigationBar.topItem?.backButtonTitle = "Назад"
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(studentIcon)
        backgroundView.addSubview(studentMessage)
        backgroundView.addSubview(studentName)
        view.addSubview(messageView)
        view.addSubview(detailView)
        detailView.addSubview(stackViewHW)
        detailView.addSubview(stackViewTeam)
        detailView.addSubview(stackViewScore)

    }
    
    private func setupLayout() {
        studentIcon.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).offset(30)
            make.height.width.equalTo(backgroundView.snp.width).multipliedBy(0.4)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(2)
        }
        
        studentName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(studentIcon.snp.bottom).offset(20)
        }
        studentMessage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(studentName.snp.bottom).offset(20)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).offset(-20)
            make.height.equalTo(view.snp.width).multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).offset(150)
        }
        
        detailView.snp.makeConstraints { make in
            make.width.equalTo(backgroundView.snp.width).offset(-25)
            make.height.equalTo(backgroundView.snp.width).multipliedBy(0.21)
            make.centerX.equalToSuperview()
            make.top.equalTo(backgroundView.snp.bottom).offset(-60)
        }
        
        stackViewHW.snp.makeConstraints { make in
            make.right.equalTo(detailView.snp.right).offset(-19)
            make.centerY.equalTo(detailView.snp.centerY)
        }
        
        stackViewTeam.snp.makeConstraints { make in
            make.left.equalTo(detailView.snp.left).offset(19)
            make.centerY.equalTo(detailView.snp.centerY)
        }
        
        stackViewScore.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(detailView.snp.center)
        }
        
        messageView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).offset(-20)
            make.height.equalTo(view.snp.width).multipliedBy(0.4)
            make.centerX.centerY.equalTo(view.snp.center)
            make.bottom.equalTo(backgroundView.snp.bottom).offset(190)
        }
    
    }
}
