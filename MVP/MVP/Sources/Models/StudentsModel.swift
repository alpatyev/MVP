//
//  DataModel.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

import Foundation

final class StudentsGroupModel {
    
    // MARK: - List of students
    
    var participants: [Student]
    
    // MARK: - Last homework number
    
    var lastHomeworkNumber: Int = 16
    
    // MARK: - Lifecycle
    
    init() {
        self.participants = [Student()]
    }
    
    // MARK: - Common methods
    
    func findPerson(named: String?) -> Student? {
        guard named != nil && named != "" else {
            return nil
        }
        guard let index = participants.firstIndex(where: { $0.name == named } ) else {
            return nil
        }
        return participants[index]
    }
    
    func findPerson(at path: IndexPath) -> Student? {
        guard path.row < participants.count && path.row >= 0 else {
            return nil
        }
        return participants[path.row]
    }
}
