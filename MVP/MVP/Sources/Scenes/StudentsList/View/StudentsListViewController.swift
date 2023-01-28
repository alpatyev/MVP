//
//  StudentListViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import UIKit
import SnapKit

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
    
    var presenter: StudentsListPresenterProtocol
    
    // MARK: - Lifecycle
    
    init(with presenter: StudentsListPresenterProtocol) {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            self?.presenter.userTappedItself()
        })
        
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
