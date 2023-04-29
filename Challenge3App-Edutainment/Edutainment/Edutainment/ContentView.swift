//
//  ContentView.swift
//  Edutainment
//
//  Created by Mostafa Hosseini on 4/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var table = 2
    @State private var totalQuestions = 5
    @State private var isSetupShown = true
    @State private var answer = ""
    @State private var questions = [(Int, Int)]()
    @State private var currentQuestion = 0
    @State private var correctAnswer = 0
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.25)
            VStack {
                if isSetupShown {
                    Stepper(
                        "Multiplication table of \(table)",
                        value: $table,
                        in: 2...12
                    )
                    
                    Stepper(
                        "\(totalQuestions) questions",
                        value: $totalQuestions,
                        in: 5...20,
                        step: 5
                    )
                    
                    Button {
                        setupQuestions()
                        isSetupShown.toggle()
                    } label: {
                        Text("Start")
                            .font(.title)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.green)
                            }
                            .foregroundColor(.black)
                    }
                } else {
                    Section {
                        Text("What is \(questions[currentQuestion].0) * \(questions[currentQuestion].1)")
                        TextField("Answer", text: $answer)
                            .onSubmit {
                                answerQuestion()
                            }
                    } header: {
                        Text("Question")
                    }
                }
            }
            .padding()
            .alert("", isPresented: $showAlert) {
                Button("Restart") {
                    
                }
            } message: {
                Text("Correct answer: \(correctAnswer)")
            }
            .animation(.default, value: isSetupShown)
        }
    }
    
    func setupQuestions() {
        for _ in 1...totalQuestions {
            questions.append((table, Int.random(in: 2 ..< 13)))
        }
    }
    
    func answerQuestion() {
        
        guard let userAnswer = Int(answer) else {return}
        let answer = questions[currentQuestion].0 * questions[currentQuestion].1
        
        if userAnswer == answer {
            correctAnswer += 1
        }
        
        if (currentQuestion + 1) == totalQuestions {
            showAlert = true
            return
        }
        self.answer = ""
        currentQuestion += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
