//
//  SceneBuilder.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation
import UIKit

final class SceneBuilder {
    static func createLoginScene(with data: StudentsGroupModel?) -> UIViewController {
        let presenter = LoginPresenter()
        let view = LoginViewController()
        presenter.configure(with: data, view)
        view.presenter = presenter
        return view
    }
    
    static func createStudentsListScene(with data: StudentsGroupModel?, selected student: Student?) -> UIViewController {
        let presenter = StudentsListPresenter()
        let view = StudentsListViewController()
        presenter.configure(with: data, student: student, view: view)
        view.configure(with: presenter)
        return UINavigationController(rootViewController: view)
    }

    static func createDetailScene(with student: Student?) -> UIViewController {
        let presenter = DetailPresenter()
        let view = DetailViewController()
        presenter.configure(with: student, view)
        view.configure(with: presenter, student)
        return view
    }
}
