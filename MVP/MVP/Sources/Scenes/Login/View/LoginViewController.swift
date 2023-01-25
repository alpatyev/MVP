//
//  BaseViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/24/23.
//

import UIKit

// MARK: - LoginView protocol

protocol LoginViewProtocol: UIViewController {
    var presenter: LoginPresenterProtocol { get set }
}

// MARK: - View class

final class LoginViewController: UIViewController, LoginViewProtocol {
    
    // MARK: - Prenter
    
    var presenter: LoginPresenterProtocol
    
    // MARK: - Lifecycle
    
    init(with presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewDidLoaded()
    }
}
