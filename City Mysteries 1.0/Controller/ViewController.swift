//
//  ViewController.swift
//  City Mysteries 1.0
//
//  Created by Jenny Muter on 16/05/2019.
//  Copyright © 2019 Jenny Muter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var givenAnswer: String = ""
    var questionNumber : Int = 0
    var score : Int = 0
    var timer:Timer?
    var timeLeft = 7200
    let images = ["dice6","Picture 2","diceeLogo"]

    

@IBOutlet weak var questionPicture: UIImageView!
@IBOutlet weak var answerResponse: UILabel!
@IBOutlet weak var questionTextLabel: UILabel!
@IBOutlet weak var answerText: UITextField!
@IBOutlet weak var nextQuestionButton: UIButton!
@IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.delegate = self
        questionPicture.image = UIImage(named:images[questionNumber])
        answerResponse.numberOfLines = 0
        questionTextLabel.numberOfLines = 0
        nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
    }

    @IBAction func answerPressed(_ sender: Any) {
        givenAnswer = answerText.text!.lowercased() //This needs refining to check for nil values and to make lowercase
        print(givenAnswer)
        checkAnswer()
    }
    
    @IBAction func hintButton(_ sender: Any) {
    }
    
    
    @IBAction func nextQuestionButton(_ sender: Any) {
        nextQuestion()
    }
    

    func nextQuestion() {
        if questionNumber == 15 {
            questionNumber = 0
        }
        else {
            questionTextLabel.text = allQuestions.list[questionNumber].questionText
            answerText.text = ""
            answerResponse.text = ""
            questionPicture.image = UIImage(named:images[questionNumber])
            nextQuestionButton.isHidden = true
            
        }
    }
    
    func checkAnswer() {
        if givenAnswer.contains(allQuestions.list[questionNumber].correctAnswerText){
            answerResponse.text = allQuestions.list[questionNumber].correctResponseText
            print("yep")
            questionNumber += 1
            nextQuestionButton.isHidden = false
            
        } else {
            answerResponse.text =
                allQuestions.list[questionNumber].incorrectResponseText
            answerText.text = ""
            print("nope")
        }
    }
    
    @objc func onTimerFires()
    {
        timeLeft -= 1
        
        if timeLeft > 3600 {
            let hour = 1;
            let minutes = Int((timeLeft - 3600)/60)
            self.timeLabel.text = "\(hour):\(minutes)"
        } else if timeLeft <= 0 {
            self.timer!.invalidate()
            self.timer = nil
            self.timeLabel.text = "Time up!"
    } else {
            let hour = 0;
            let minutes = Int(timeLeft/60)
            self.timeLabel.text = "\(hour):\(minutes)"
      }
    }
    
}
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
