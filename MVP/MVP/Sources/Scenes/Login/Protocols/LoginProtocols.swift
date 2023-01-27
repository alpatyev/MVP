//
//  LoginProtocols.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit

// MARK: - Presenter protocol

protocol LoginPresenterProtocol: AnyObject {
    var model: PersonsModelProtocol { get set }
    var view: LoginViewProtocol? { get set }
    init(with model: PersonsModelProtocol)
}

// MARK: - Login view protocol

protocol LoginViewProtocol: UIViewController {
    var presenter: LoginPresenterProtocol { get set }
    init(with presenter: LoginPresenterProtocol)
}
