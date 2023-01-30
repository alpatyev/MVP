//
//  LoginPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

// MARK: - Presenter protocol

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? { get set }
    
    func textFieldSelected()
    func keyboardReturnTapped(text: String?)
    func loginButtonTapped(text: String?)
}

// MARK: - Login presenter class

final class LoginPresenter: LoginPresenterProtocol {
    
    // MARK: - Model
    
    private var model: StudentsGroupModel?
    
    // MARK: - View
    
    weak var view: LoginViewProtocol?
    
    // MARK: - Configure with model and view
    
    public func configure(with model: StudentsGroupModel?, _ view: LoginViewProtocol?) {
        self.model = model
        self.view = view
    }
    
    // MARK: - Move to next scene
    
    private func findPersonWith(name: String?) {
        guard let person = model?.findPerson(named: name) else {
            view?.showAlert("Пользователь не найден (")
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
