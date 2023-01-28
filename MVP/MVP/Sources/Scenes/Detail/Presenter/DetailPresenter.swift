//
//  DetailPresenter.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - Model
    
    var model: IDProtocol
    
    // MARK: - View
    
    weak var view: DetailViewProtocol?
    
    // MARK: - Lifecycle
    
    required init(with model: IDProtocol) {
        self.model = model
    }
}
