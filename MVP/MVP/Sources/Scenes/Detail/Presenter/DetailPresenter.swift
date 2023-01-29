//
//  DetailPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

// MARK: - Detail presenter protocol

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
}

// MARK: - Detail presenter class

final class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - Model
    
    private var student: Student?
    
    // MARK: - View
    
    weak var view: DetailViewProtocol?
    
    // MARK: - Configure with model and view
    
    public func configure(with student: Student?, _ view: DetailViewProtocol?) {
        self.student = student
        self.view = view
    }
}
