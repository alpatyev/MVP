//
//  SceneBuilder.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation
import UIKit

protocol SceneBuilderProtocol {
    static func createLoginScene(with data: [Student]) -> LoginViewProtocol?
    static func createStudentListScene(with data: [Student]) -> UIViewController?
}

final class SceneBuilder: SceneBuilderProtocol {
    
    static func createLoginScene(with data: [Student]) -> LoginViewProtocol? {
        // init services and modules
        nil
    }
    
    static func createStudentListScene(with data: [Student]) -> UIViewController? {
        // init services and modules
        nil
    }
}

/*

protocol AssemblyModuleBuilderProtocol {
    static func createHomeModule() -> UIViewController
    static func createDetailModule(post: Post?) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    static func createHomeModule() -> UIViewController {
        let view = HomeViewController()
        let networkService = NetworkService()
        let presenter = HomePresenter(view: view, networkService: networkService)
        view.presenter = presenter
        
        return view
    }
    
    static func createDetailModule(post: Post?) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, post: post)
        view.presenter = presenter
        
        return view
    }
}

*/
