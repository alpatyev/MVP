//
//  StudentsListPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation

// MARK: - Presenter protocol

protocol StudentsListPresenterProtocol: AnyObject {
    var view: StudentsListViewProtocol? { get set }
    func updateViewData()
    func userTappedItself()
    func selectedRow(at path: IndexPath)
}

// MARK: - Students list presenter class

final class StudentsListPresenter: StudentsListPresenterProtocol {

    // MARK: - Models
    
    private var model: StudentsGroupModel? {
        willSet {
            view?.updateSubviews(with: newValue)
        }
    }
    
    private var student: Student? {
        willSet {
            view?.updateSubviews(with: newValue)
        }
    }
    
    // MARK: - View
    
    weak var view: StudentsListViewProtocol?
    
    // MARK: - Configure with model and view
    
    public func configure(with model: StudentsGroupModel?, student: Student?, view: StudentsListViewProtocol?) {
        self.model = model
        self.student = student
        self.view = view
    }
    
    // MARK: - Update view
    
    func updateViewData() {
        view?.updateSubviews(with: model)
        view?.updateSubviews(with: student)
    }
    
    // MARK: - Move to detail scene
    
    func userTappedItself() {
        let detailView = SceneBuilder.createDetailScene(with: student)
        view?.performViewController(detailView)
    }
    
    func selectedRow(at path: IndexPath) {
        let detailView = SceneBuilder.createDetailScene(with: model?.findPerson(at: path))
        view?.performViewController(detailView)
    }
}
