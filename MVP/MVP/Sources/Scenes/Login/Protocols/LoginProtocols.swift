//
//  LoginProtocols.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit

// MARK: - Presenter protocol

protocol LoginPresenterProtocol: AnyObject {
    var model: PersonsModelProtocol { get set }
    var view: LoginViewProtocol? { get set }
    init(with model: PersonsModelProtocol)
    
    func textFieldSelected()
    func keyboardReturnTapped(text: String?)
    func loginButtonTapped(text: String?)
}

// MARK: - Login view protocol

protocol LoginViewProtocol: UIViewController {
    var presenter: LoginPresenterProtocol { get set }
    init(with presenter: LoginPresenterProtocol)
    
    func highlightTextField()
    func revertHiglightedTextField()
    func performViewController(_ controller: UIViewController)
}
