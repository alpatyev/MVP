//
//  StudentsListPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation

final class StudentsListPresenter: StudentsListPresenterProtocol {
    
    // MARK: - Model
    
    var model: PersonsModelProtocol
    
    // MARK: - View
    
    weak var view: StudentsListViewProtocol?
    
    // MARK: - Lifecycle
    
    init(with model: PersonsModelProtocol) {
        self.model = model
    }
}
