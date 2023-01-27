//
//  DetailViewController.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController, DetailViewProtocol {
    
    // MARK: - Presenter
    
    var presenter: DetailPresenterProtocol
    
    // MARK: - Lifecycle
    
    init(with presenter: DetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
