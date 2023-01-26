//
//  LoginPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation

// MARK: - Presenter class

final class LoginPresenter: PresenterProtocol {
    
    // MARK: - Model
    
    var model: PersonsModelProtocol
    
    // MARK: - View
    
    weak var view: ViewProtocol?
    
    // MARK: - Lifecycle
    
    init(with model: PersonsModelProtocol) {
        self.model = model
    }

    // MARK: - View loaded
    
    func viewLoaded() {}
}
