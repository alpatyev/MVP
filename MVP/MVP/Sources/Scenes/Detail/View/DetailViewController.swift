//
//  DetailViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit
import SnapKit

// MARK: - Login view protocol

protocol DetailViewProtocol: UIViewController {
    var presenter: DetailPresenterProtocol? { get set }
}

// MARK: - Detail view class

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
    
    private lazy var messageView: UITextView = {
        let subview = UITextView()
        subview.backgroundColor = .clear.withAlphaComponent(0.5)
        subview.layer.borderWidth = 1
        subview.layer.borderColor = Constants.Colors.primary.cgColor
        subview.layer.cornerRadius = 12
        subview.textColor = .white
        subview.font = UIFont.italicSystemFont(ofSize: 19)
        subview.textAlignment = .left
        subview.layer.masksToBounds = true
        return subview
    }()
    
    private lazy var studentName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textColor = .white
        label.text = "??????????????"
        return label
    }()
    
    private lazy var studentTeam: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.text = "????????????????????"
        return label
    }()

    private lazy var studentScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemRed
        label.text = "0"
        return label
    }()
    
    private lazy var studentHWPassed: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.text = "0 ???? 0"
        return label
    }()
    
    private lazy var studentTeamDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textColor = .gray
        label.text = "??????????????"
        return label
    }()

    private lazy var studentScoreDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textColor = .gray
        label.text = "??????????"
        return label
    }()
    
    private lazy var studentHWPassedDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textColor = .gray
        label.text = "?????????? ??????????????"
        return label
    }()
    
    private lazy var studentMessage: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textColor = .white
        label.text = "8-???? ??????????"
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

    var presenter: DetailPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Configure with student
    
    public func configure(with presenter: DetailPresenterProtocol, _ data: Student?) {
        self.presenter = presenter
        guard let student = data else {
            return
        }
        title = student.name
        if let imageThatExists = UIImage(named: student.image){
            studentIcon.image = imageThatExists
        }
        studentName.text = student.name
        studentTeam.text = student.team
        studentScore.text = "\(student.score)"
        messageView.text = student.message
        studentHWPassed.text = "\(student.homeworksPassed) ???? \(StudentsGroupModel.lastHomeworkNumber)"
    }
    
    
    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = Constants.Colors.background
        navigationController?.navigationBar.topItem?.backButtonTitle = "??????????"
    }
    
    private func setupHierarchy() {
        view.insertBackgroundImage(named: "waves")
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
            make.top.equalTo(view.safeAreaLayoutGuide)
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
            make.left.right.equalTo(backgroundView)
            make.top.equalTo(detailView.snp.bottom).offset(2)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

