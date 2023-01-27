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
        self.participants = [Student(name: "", image: "", score: 0)]
        // data request
    }
}
