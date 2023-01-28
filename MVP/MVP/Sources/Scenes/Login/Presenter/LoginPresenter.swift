//
//  LoginPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

final class LoginPresenter: LoginPresenterProtocol {
    
    // MARK: - Model
    
    var model: PersonsModelProtocol
    
    // MARK: - View
    
    weak var view: LoginViewProtocol?
    
    // MARK: - Lifecycle
    
    init(with model: PersonsModelProtocol) {
        self.model = model
    }
    
    // MARK: - Move to next scene
    
    private func findPersonWith(name: String?) {
        guard let person = model.findPerson(named: name) else {
            return
        }
        let mainView = SceneBuilder.createStudentsListScene(with: model, selected: person)
        view?.performViewController(mainView)
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
