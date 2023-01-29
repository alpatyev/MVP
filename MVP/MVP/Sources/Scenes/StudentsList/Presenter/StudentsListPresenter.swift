//
//  StudentsListPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

// MARK: - Presenter protocol

protocol StudentsListPresenterProtocol: AnyObject {
    var view: StudentsListViewProtocol? { get set }
    func userTappedItself()
}

// MARK: - Students list presenter class

final class StudentsListPresenter: StudentsListPresenterProtocol {
    
    // MARK: - Models
    
    private var model: StudentsGroupModel?
    private var student: Student?
    
    // MARK: - View
    
    weak var view: StudentsListViewProtocol?
    
    // MARK: - Configure with model and view
    
    public func configure(with model: StudentsGroupModel?, _ student: Student?,_ view: StudentsListViewProtocol?) {
        self.model = model
        self.student = student
        self.view = view
    }

    
    // MARK: - Move to detail scene
    
     func userTappedItself() {
         let detailView = SceneBuilder.createDetailScene(with: student)
        view?.performViewController(detailView)
    }
}
