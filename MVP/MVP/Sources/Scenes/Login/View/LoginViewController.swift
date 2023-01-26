//
//  BaseViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/24/23.
//

import UIKit


// MARK: - View class

final class LoginViewController: UIViewController, ViewProtocol {
    
    // MARK: - Prenter
    
    var presenter: PresenterProtocol
    
    // MARK: - Lifecycle
    
    init(with presenter: PresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewLoaded()
    }
}
