//
//  StudentListViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import UIKit
import SnapKit

final class StudentsListView: UIViewController, StudentsListViewProtocol {
    
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
        print(presenter.student)
        view.backgroundColor = .red
    }
}
