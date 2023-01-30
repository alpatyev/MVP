//
//  BaseViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/24/23.
//

import UIKit
import SnapKit

// MARK: - Login view protocol

protocol LoginViewProtocol: UIViewController {
    var presenter: LoginPresenterProtocol? { get set }
    
    func highlightTextField()
    func revertHiglightedTextField()
    func showAlert(_ text: String)
    func performViewController(_ controller: UIViewController)
}

final class LoginViewController: UIViewController, LoginViewProtocol {
    
    // MARK: - UI
    
    private lazy var factoryIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.roundedBorders()
        imageView.image = UIImage(named: "courseLogo")
        imageView.clipsToBounds = true
        imageView.sizeToFit()
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.roundedBorders()
        textField.createShadowLayer()
        textField.backgroundColor = Constants.Colors.background
        textField.textAlignment = .center
        textField.placeholder = "введите имя"
        textField.keyboardType = .alphabet
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
        textField.returnKeyType = .go
        textField.delegate = self
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.roundedBorders()
        button.createShadowLayer()
        button.backgroundColor = Constants.Colors.primary
        button.setTitleColor(Constants.Colors.lightText,
                             for: .normal)
        button.setTitleColor(Constants.Colors.primary,
                             for: .highlighted)
        button.setTitle("Вперед", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Prenter
    
    var presenter: LoginPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    func performViewController(_ controller: UIViewController) {
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - Configure with presenter
    
    public func configure(with presenter: LoginPresenterProtocol?) {
        self.presenter = presenter
    }
    
    // MARK: - Setups
    
    private func setupView() {
        view.insertBackgroundImage(named: "waves")
        view.addBlurLayer()
    }
    
    private func setupHierarchy() {
        view.addSubview(factoryIcon)
        view.addSubview(nameTextField)
        view.addSubview(loginButton)
    }
    
    private func setupLayout() {
        nameTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(Constants.Layout.paging)
            make.center.equalToSuperview()
        }
        
        factoryIcon.snp.makeConstraints { make in
            make.width.height.equalTo(view.snp.width).multipliedBy(0.4)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().dividedBy(2)
        }
        
        loginButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(Constants.Layout.paging)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextField.snp.bottom).offset(Constants.Layout.paging)
        }
    }
    
    // MARK: - Actions
    
    @objc private func loginTapped() {
        presenter?.loginButtonTapped(text: nameTextField.text)
    }
        
    func highlightTextField() {
        view.insertBackgroundImage(named: "waves", alpha: 0.68)
    }
    
    func revertHiglightedTextField() {
        view.insertBackgroundImage(named: "waves")
        nameTextField.resignFirstResponder()
    }
    
    func showAlert(_ text: String) {
        let alert = UIAlertController(title: "Ошибка 💩", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Textfield delegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter?.keyboardReturnTapped(text: textField.text)
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        presenter?.textFieldSelected()
        return true
    }
}
