//
//  StudentsListPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation

final class StudentsListPresenter: StudentsListPresenterProtocol {
    
    // MARK: - Models
    
    var model: PersonsModelProtocol
    var student: IDProtocol
    
    // MARK: - View
    
    weak var view: StudentsListViewProtocol?
    
    // MARK: - Lifecycle
    
    init(with model: PersonsModelProtocol, selected student: IDProtocol) {
        self.model = model
        self.student = student
    }
}
