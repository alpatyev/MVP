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
    var team: String { get set }
    var message: String { get set }
    
    var score: Int { get set }
    var homeworksPassed: Int { get set }
}

protocol PersonsModelProtocol {
    var participants: [IDProtocol] { get set }
    var lastHomeworkNumber: Int { get set }
    func findPerson(named: String?) -> IDProtocol?
}

// MARK: - Builder protocol

protocol SceneBuilderProtocol {
    static func createLoginScene(with data: PersonsModelProtocol) -> UIViewController
    static func createStudentsListScene(with data: PersonsModelProtocol, selected person: IDProtocol) -> UIViewController
    static func createDetailScene(with data: IDProtocol) -> UIViewController
}
