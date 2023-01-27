//
//  SceneBuilder.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation
import UIKit

final class SceneBuilder: SceneBuilderProtocol {
    static func createLoginScene(with data: PersonsModelProtocol) -> UIViewController? {
        let presenter = LoginPresenter(with: data)
        let view = LoginViewController(with: presenter)
        return view
    }
    
    static func createStudentListScene(with data: PersonsModelProtocol, selected person: IDProtocol) -> UIViewController? {
        let presenter = StudentsListPresenter(with: data, selected: person)
        let view = StudentsListView(with: presenter)
        return view
    }
}
