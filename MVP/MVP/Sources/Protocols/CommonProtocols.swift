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
    func findPerson(named: String?) -> IDProtocol?
}

// MARK: - Builder protocol

protocol SceneBuilderProtocol {
    static func createLoginScene(with data: PersonsModelProtocol) -> UIViewController?
    static func createStudentListScene(with data: PersonsModelProtocol, selected person: IDProtocol) -> UIViewController?
}
