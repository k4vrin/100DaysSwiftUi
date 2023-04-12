//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mostafa Hosseini on 4/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var playerChoice: GameMove? = nil
    @State private var appChoice: GameMove
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 1
    @State private var showAlert = false
    @State private var showFinalAlert = false
    let moves = [GameMove.Rock, GameMove.Paper, GameMove.Scissor]

    init(playerChoice: GameMove? = nil, shouldWin: Bool = Bool.random(), score: Int = 0, round: Int = 1) {
        self.playerChoice = playerChoice
        self.appChoice = moves[Int.random(in: 0 ... 2)]
        self.shouldWin = shouldWin
        self.score = score
        self.round = round
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [.white, .cyan],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {
                    Spacer()
                    GameMoveView(text: appChoice.description, emoji: appChoice.emoji)
                    Text(shouldWin ? "Win" : "Loose")
                        .font(.system(size: 64, weight: .bold))
                    GameMoveView(
                        text: playerChoice?.description ?? "Choose",
                        emoji: playerChoice?.emoji ?? "❓"
                    )
                    Spacer()
                    HStack {
                        ForEach(moves.indices, id: \.self) { pos in
                            GameMoveButton(emoji: moves[pos].emoji) {
                                playerChoice = moves[pos]
                                score += scoreRound(playerMove: playerMove())
                                if round >= 10 {
                                    showFinalAlert = true
                                    return
                                }
                                showAlert = true
                            }
                        }
                    }
                    .alert(playerChoice == playerMove() ? "Correct" : "Wrong" , isPresented: $showAlert) {
                        Button("Next") {
                            playerChoice = nil
                            round += 1
                            shouldWin = Bool.random()
                            appChoice = moves[Int.random(in: 0 ... 2)]
                        }
                    }
                    .alert("Result", isPresented: $showFinalAlert) {
                        Button("Restart") {
                            playerChoice = nil
                            round = 1
                            shouldWin = Bool.random()
                            appChoice = moves[Int.random(in: 0 ... 2)]
                            score = 0
                            
                        }
                    } message: {
                        Text("Final score: \(score)")
                    }

                    Spacer()

                    VStack {
                        Text("Round: \(round)")
                        Text("Score: \(score)")
                    }
                    .padding()
                    .foregroundStyle(.secondary)
                    .font(.title2)
                    .frame(
                        maxWidth: .infinity
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(.ultraThinMaterial)
                    )
                    .padding()

                    Spacer()
                    Spacer()
                }
            }
            .navigationTitle("🪨, 📃, ✂️")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func playerMove() -> GameMove {
        switch appChoice {
        case .Rock:
            return shouldWin ? .Paper : .Scissor
        case .Paper:
            return shouldWin ? .Scissor : .Rock
        case .Scissor:
            return shouldWin ? .Rock : .Paper
        }
    }

    func scoreRound(playerMove: GameMove) -> Int {
        playerMove == playerChoice ? 1 : -1
    }
}

struct GameMoveView: View {
    let text: String
    let emoji: String
    var body: some View {
        VStack {
            Text(text)
            Text(emoji)
        }
        .foregroundColor(.secondary)
        .font(.largeTitle)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.ultraThinMaterial)
        )
    }
}

struct GameMoveButton: View {
    let emoji: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(emoji)
                .font(.largeTitle)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(.ultraThinMaterial)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Collection {
    func getOrNil(pos: Self.Index?) -> Self.Element? {
        guard let position = pos else {
            return nil
        }
        return self[position]
    }
}

enum GameMove: CustomStringConvertible {
    case Rock, Paper, Scissor

    var description: String {
        switch self {
        case .Rock: return "Rock"
        case .Paper: return "Paper"
        case .Scissor: return "Scissor"
        }
    }

    var emoji: String {
        switch self {
        case .Rock: return "🪨"
        case .Paper: return "📃"
        case .Scissor: return "✂️"
        }
    }
}
