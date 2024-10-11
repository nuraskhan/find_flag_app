//
//  Question.swift
//  FindFlagApp
//
//  Created by Aldongarov Nuraskhan on 08.10.2024.
//

import Foundation
import SwiftUI

struct Question {
    let questionFlag:Image
    let correctAnswer: Country
    var options: [Country]
    
    init(correctAnswer: Country, options: [Country]) {
        self.questionFlag = correctAnswer.flagImage
        self.correctAnswer = correctAnswer
        self.options = options + [correctAnswer]
    }
}
