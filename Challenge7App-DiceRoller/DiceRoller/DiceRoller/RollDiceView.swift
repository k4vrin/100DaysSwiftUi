//
//  RollDiceView.swift
//  DiceRoller
//
//  Created by Mostafa Hosseini on 8/21/23.
//

import SwiftUI
import WrappingHStack

struct RollDiceView: View {
    @StateObject private var viewModel = DiceViewModel()

    @State private var timeRemaining: Double = 1
    @State var isTimerRunning = false

    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ScrollView {
                WrappingHStack {
                    ForEach(self.viewModel.state.dices, id: \.self) { dice in
                        VStack {
                            Text("\(dice.number)")
                            Text("Dice NO\(dice.sides)")
                        }
                        .padding()
                    }
                }

                Button {
                    if isTimerRunning {
                        stopTimer()
                        startTimer()
                    } else {
                        startTimer()
                    }
                } label: {
                    Text("Roll")
                }
                .onReceive(self.timer) { m in
                    print(m)
                    withAnimation {
                        self.viewModel.roll()
                    }
                    self.timeRemaining -= 0.1
                    if self.timeRemaining < 0 {
                        stopTimer()
                        viewModel.saveHistory()
                    }
                }
                
                ForEach(viewModel.state.history, id: \.self) { hist in
                    Text("\(hist)")
                }
            }
            .navigationTitle("DiceRoller")
            .onAppear {
                stopTimer()
            }
        }
    }

    func stopTimer() {
        self.timer.upstream.connect().cancel()
        self.isTimerRunning = false
        timeRemaining = 1
    }

    func startTimer() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        self.isTimerRunning = true
    }
}

struct RollDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceView()
    }
}
