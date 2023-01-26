//
//  CommonProtocols.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/26/23.
//

import UIKit

// MARK: - Model protocols

protocol IDProtocol: Codable {
    var name: String { get set }
    var image: String { get set }
    var score: Int { get set }
}

protocol PersonsModelProtocol {
    var participants: [IDProtocol] { get set }
}

// MARK: - Presenter protocol

protocol PresenterProtocol: AnyObject {
    var model: PersonsModelProtocol { get set }
    var view: ViewProtocol? { get set }
    init(with model: PersonsModelProtocol)
    func viewLoaded()
}

// MARK: - LoginView protocol

protocol ViewProtocol: UIViewController {
    var presenter: PresenterProtocol { get set }
    init(with presenter: PresenterProtocol)
}

// MARK: - Builder protocol

protocol SceneBuilderProtocol {
    static func createLoginScene(with data: PersonsModelProtocol) -> ViewProtocol?
    static func createStudentListScene(with data: PersonsModelProtocol) -> ViewProtocol?
}
