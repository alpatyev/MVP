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
        subview.createShadowLayer(withCornerradius: 0, opacity: 0.75)
        return subview
    }()
    
    private lazy var studentList: UITableView = {
        let list = UITableView()
        list.backgroundColor = .clear
        list.delegate = self
        list.dataSource = self
        list.register(StudentCell.self,
                      forCellReuseIdentifier: StudentCell.id)
        return list
    }()
    
    // MARK: - Presenter
    
    var presenter: StudentsListPresenterProtocol?
    
    // MARK: - List of students
    
    var studentsArray: [Student]?

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
    
    func updateSubviews(with data: Student?) {
        studentView.configure(with: data)
    }
    
    func updateSubviews(with data: StudentsGroupModel?) {
        studentsArray = data?.participants
        studentList.reloadData()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "Список студентов"
        view.insertBackgroundImage(named: "waves")
        let tap = UITapGestureRecognizer(target: self, action: #selector(studentTapped))
        studentView.addGestureRecognizer(tap)
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
        
        studentList.snp.makeConstraints { make in
            make.top.equalTo(studentView.snp.bottom).offset(1)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaInsets)
        }
    }
    
    // MARK: - Actions
    
    func performViewController(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func studentTapped(_ sender: UITapGestureRecognizer? = nil) {
        presenter?.userTappedItself()
    }
}

// MARK: - Table view delegates

extension StudentsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentsArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = studentList.dequeueReusableCell(withIdentifier: StudentCell.id,
                                                  for: indexPath) as? StudentCell else {
            return UITableViewCell()
        }
        cell.configure(with: studentsArray?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        studentList.deselectRow(at: indexPath, animated: true)
        presenter?.userTappedRow(at: indexPath)
    }
}
