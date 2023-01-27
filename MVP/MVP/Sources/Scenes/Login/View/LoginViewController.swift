//
//  BaseViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/24/23.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController, LoginViewProtocol {
    
    // MARK: - Prenter
    
    var presenter: LoginPresenterProtocol
    
    // MARK: - Lifecycle
    
    init(with presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
