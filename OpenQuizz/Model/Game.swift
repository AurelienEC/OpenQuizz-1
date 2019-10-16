//
//  Game.swift
//  OpenQuizz
//
//  Created by Stephane Gabillet on 08/10/2019.
//  Copyright © 2019 Stephane Gabillet. All rights reserved.
//

import Foundation

class Game {
    enum State {
        case ongoing, over
    }
    
    var score = 0
    var questions = [Question]()
    var state = State.ongoing
    private var currentIndex = 0
  
    public var currentQuestion: Question {
        get {
            return questions[currentIndex]
        }
    }
  
    func answerCurrentQuestion(with answer: Bool) {
        if answer == currentQuestion.isCorrect {
            score += 1
        }
        if questions.count == currentIndex + 1 {
            state = State.over
        } else {
            currentIndex += 1
        }
    }
  
    func refresh() {
        score = 0
        state = State.over
        currentIndex = 0
        
        QuestionManager.shared.get { (questions) in
            self.questions = questions
            self.state = .ongoing
            
            let name = Notification.Name(rawValue: "QuestionsLoaded")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)
        }
    }
    
    private func receiveQuestions(_ questions: [Question]){
        
    }
    
    
}

