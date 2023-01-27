//
//  DataModel.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/25/23.
//

// MARK: - Model entities

struct Student: IDProtocol {
    var name: String
    var image: String
    var score: Int
}

final class StudentsGroupModel: PersonsModelProtocol {
    
    // MARK: - List of students
    
    var participants: [IDProtocol]
    
    // MARK: - Lifecycle
    
    init() {
        self.participants = [Student(name: "abc", image: "image", score: 123)]
    }
    
    // MARK: - Common methods
    
    func findPerson(named: String?) -> IDProtocol? {
        guard named != nil && named != "" else {
            return nil
        }
        guard let index = participants.firstIndex(where: { $0.name == named } ) else {
            return nil
        }
        return participants[index]
    }
}
