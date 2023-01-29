//
//  Student.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

struct Student {
    var name: String
    var image: String
    var team: String
    var message: String
    var score: Int = 0
    var homeworksPassed: Int = 0
    
    init(name: String = "a",
         image: String = "unknownStudentIcon",
         team: String = "неизвестная тима",
         message: String = "Привет! Я учусь на восьмом потоке mobDevCourse :)",
         score: Int = 0,
         homeworksPassed: Int = 0) {
        self.name = name
        self.image = image
        self.team = team
        self.message = message
        self.score = score
        self.homeworksPassed = homeworksPassed
    }
}
