//
//  LoginPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import UIKit

final class LoginPresenter: LoginPresenterProtocol {
    
    // MARK: - Model
    
    var model: PersonsModelProtocol
    
    // MARK: - View
    
    weak var view: LoginViewProtocol?
    
    // MARK: - Lifecycle
    
    init(with model: PersonsModelProtocol) {
        self.model = model
    }
}
