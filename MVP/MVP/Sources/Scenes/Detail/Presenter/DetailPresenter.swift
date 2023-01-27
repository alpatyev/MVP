//
//  DetailPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit

final class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - Model
    
    var model: PersonsModelProtocol
    
    // MARK: - View
    
    weak var view: DetailViewProtocol?
    
    // MARK: - Lifecycle
    
    required init(with model: PersonsModelProtocol) {
        self.model = model
    }
}
