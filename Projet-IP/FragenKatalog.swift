//
//  FragenKatalog.swift
//  Projet-IP
//
//  Created by Johannes Velde on 22/01/2017.
//  Copyright © 2017 Johannes Velde. All rights reserved.
//

import Foundation

class FragenKatalog{
    
    let question: String!
    let answer: Bool!
    let explanation: String!
    var usersAnswer: Bool?
    
    init(question: String, answer: Bool, explanation: String) {
        self.question = question
        self.answer = answer
        self.explanation = explanation
    }
}
