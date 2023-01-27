//
//  DetailProtocols.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit

// MARK: - Presenter protocol

protocol DetailPresenterProtocol: AnyObject {
    var model: PersonsModelProtocol { get set }
    var view: DetailViewProtocol? { get set }
    init(with model: PersonsModelProtocol)
}

// MARK: - Login view protocol

protocol DetailViewProtocol: UIViewController {
    var presenter: DetailPresenterProtocol { get set }
    init(with presenter: DetailPresenterProtocol)
}
