//
//  QuestionBank.swift
//  City Mysteries 1.0
//
//  Created by Jenny Muter on 16/05/2019.
//  Copyright © 2019 Jenny Muter. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()
    
    init() {
        list.append(Question(text: "Where do you need to go?", answer: "sawyer", correctResponse: "Ah, I think you've cracked it. Let's head over to The Sawyer Arms and see if we can find out anything", incorrectResponse: "That's not quite it - try again", qHint: "Where would you drink beer?"))
        
        list.append(Question(text: "Where should you go next?",answer: "john rylands", correctResponse: "Yes, Enriqueta Rylands built the library. I think you should head over there", incorrectResponse: "No, I'm not sure you're on the right lines", qHint: "What building did Enriqueta found?"))
        
        list.append(Question(text: "Where is the next meeting of the Luminaries?", answer: "chetham", correctResponse: "We'd better head over to Chetham's quickly to listen in", incorrectResponse: "Have another go", qHint: "Go into the Historic Reading Room"))
        
    }
}
