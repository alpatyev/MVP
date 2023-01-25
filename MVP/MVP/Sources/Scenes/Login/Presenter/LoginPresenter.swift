//
//  LoginPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation

// MARK: - Presenter protocol

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    func viewDidLoaded()
}

// MARK: - Presenter class

final class LoginPresenter: LoginPresenterProtocol {
    
    // MARK: - View
    
    weak var view: LoginViewProtocol?
    
    // MARK: - View has loaded
    
    func viewDidLoaded() {}
}
