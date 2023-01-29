//
//  StudentListViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import UIKit
import SnapKit

// MARK: - Login view protocol

protocol StudentsListViewProtocol: UIViewController {
    var presenter: StudentsListPresenterProtocol? { get set }
    func updateSubviews(with data: Student?)
    func updateSubviews(with data: StudentsGroupModel?)
    func performViewController(_ controller: UIViewController)
}

final class StudentsListViewController: UIViewController, StudentsListViewProtocol {
    
    // MARK: - UI
    
    private lazy var studentView: StudentView = {
        let subview = StudentView()
        return subview
    }()
    
    private lazy var studentList: UITableView = {
        let list = UITableView()
        return list
    }()
    
    // MARK: - Presenter
    
    var presenter: StudentsListPresenterProtocol?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        presenter?.updateViewData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Configure with presenter
    
    public func configure(with presenter: StudentsListPresenterProtocol?) {
        self.presenter = presenter
        
    }
    
    func updateSubviews(with data: Student?) {
        studentView.configure(with: data)
    }
    
    func updateSubviews(with data: StudentsGroupModel?) {
        //
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "Список студентов"
        view.backgroundColor = Constants.Colors.background
    }
    
    private func setupHierarchy() {
        view.addSubview(studentView)
        view.addSubview(studentList)
    }
    
    private func setupLayout() {
        studentView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.snp.width).multipliedBy(0.4)
        }
    }
    
    // MARK: - Actions
    
    func performViewController(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
}
