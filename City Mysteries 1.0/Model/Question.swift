//
//  Question.swift
//  City Mysteries 1.0
//
//  Created by Jenny Muter on 16/05/2019.
//  Copyright © 2019 Jenny Muter. All rights reserved.
//

import Foundation

//class UIImage : NSObject {
//     init(named: String) {
//     }
//}

class Question {
    
    let questionText : String
    let correctAnswerText : String
    let correctResponseText : String
    let incorrectResponseText: String
    let hint : String
    
    init(text: String, answer : String, correctResponse: String, incorrectResponse: String, qHint : String) {
    questionText = text
    correctAnswerText = answer
    correctResponseText = correctResponse
    incorrectResponseText = incorrectResponse
    hint = qHint
    }
}
