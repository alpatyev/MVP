//
//  LoginPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation

final class LoginPresenter: LoginPresenterProtocol {
    
    // MARK: - Model
    
    var model: PersonsModelProtocol
    
    // MARK: - View
    
    weak var view: LoginViewProtocol?
    
    // MARK: - Lifecycle
    
    init(with model: PersonsModelProtocol) {
        self.model = model
    }
    
    // MARK: - Private methods
    
    private func findUser(_ name: String) { }
    
    // MARK: - View send events
    
    func textFieldSelected() {
        view?.highlightTextField()
    }
    
    func loginButtonTapped(text: String?) {
        view?.revertHiglightedTextField()
        if let name = text {
            findUser(name)
        }
    }
    
    func keyboardReturnTapped(text: String?) {
        view?.revertHiglightedTextField()
        if let name = text {
            findUser(name)
        }
    }
}
