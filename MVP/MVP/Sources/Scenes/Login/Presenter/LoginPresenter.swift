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
    
    private func findPersonWith(name: String?) {
        guard let person = model.findPerson(named: name) else {
            return
        }
        guard let viewController = SceneBuilder.createStudentListScene(with: model, selected: person) else {
            return
        }
        view?.performViewController(viewController)
    }
    
    // MARK: - View send events
    
    func textFieldSelected() {
        view?.highlightTextField()
    }
    
    func loginButtonTapped(text: String?) {
        view?.revertHiglightedTextField()
        findPersonWith(name: text)
    }
    
    func keyboardReturnTapped(text: String?) {
        view?.revertHiglightedTextField()
        findPersonWith(name: text)
    }
}
