//
//  StudentsListProtocols.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit

// MARK: - Presenter protocol

protocol StudentsListPresenterProtocol: AnyObject {
    var model: PersonsModelProtocol { get set }
    var student: IDProtocol { get set }
    var view: StudentsListViewProtocol? { get set }
    init(with model: PersonsModelProtocol, selected student: IDProtocol)
}

// MARK: - Login view protocol

protocol StudentsListViewProtocol: UIViewController {
    var presenter: StudentsListPresenterProtocol { get set }
    init(with presenter: StudentsListPresenterProtocol)
}
