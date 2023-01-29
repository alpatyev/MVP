//
//  DetailViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit
import SnapKit

// MARK: - Login view protocol

protocol DetailViewProtocol: UIViewController {
    var presenter: DetailPresenterProtocol? { get set }
}

// MARK: - Detail view class

final class DetailViewController: UIViewController, DetailViewProtocol {
    
    // MARK: - Presenter
    
    var presenter: DetailPresenterProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Configure with presenter
    
    public func configure(with presenter: DetailPresenterProtocol?) {
        self.presenter = presenter
    }
    
    // MARK: - Setups
    
    private func setupView() {
        title = "<Имя студента>"
        view.backgroundColor = Constants.Colors.background
        navigationController?.navigationBar.topItem?.backButtonTitle = "Назад"
    }
    
    private func setupHierarchy() {
    }
    
    private func setupLayout() {
    }
}
