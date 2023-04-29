//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mostafa Hosseini on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animation = false

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State var score = 0
    @State var totalQuestions = 0
    @State var showEndResult = false
    @State var selectedNumber = -1

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
            .ignoresSafeArea()

            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0 ..< 3) { number in
                        Button {
                            flagTaped(number)
                            selectedNumber = number
                            animation.toggle()
                        } label: {
                            FlagImage(countries[number])
                                .rotation3DEffect(
                                    .degrees(selectedNumber == number && animation ? 365 : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(selectedNumber != number && animation ? 0.25 : 1)
                        }
                    }
                }
                .animation(.default, value: animation)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 16)

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            .alert("Result", isPresented: $showEndResult) {
                Button("Restart", action: restartGame)
            } message: {
                Text("Your final score is \(score)")
            }
        }
    }

    func flagTaped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(flagOf(number: number))"
        }
        totalQuestions += 1

        if totalQuestions >= 8 {
            showEndResult = true
        } else {
            showingScore = true
        }
    }

    func askQuestion() {
        animation.toggle()
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func restartGame() {
        animation.toggle()
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        totalQuestions = 0
    }

    func flagOf(number: Int) -> String {
        if number < countries.count {
            return countries[number]
        } else {
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
