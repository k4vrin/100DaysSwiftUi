//
//  RollDiceView.swift
//  DiceRoller
//
//  Created by Mostafa Hosseini on 8/21/23.
//

import SwiftUI
import WrappingHStack
import CoreHaptics

struct RollDiceView: View {
    @StateObject private var viewModel = DiceViewModel()

    @State private var timeRemaining: Double = 1
    @State var isTimerRunning = false
    @State var isSheetPresenterd = false
    @State private var showingAlert = false
    @State private var hapticManager = HapticManager()

    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            List {
                Section {
                    WrappingHStack(0 ..< self.viewModel.state.dices.count, id: \.self) { index in

                        VStack {
                            Text("\(self.viewModel.state.dices[index].number)")
                                .font(.largeTitle)
                            Text("NO\(index + 1)")
                                .font(.caption2)
                        }
                        .frame(width: 64, height: 64)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.blue, lineWidth: 2)
                        )
                        .padding()
                        .accessibilityElement()
                        .accessibilityLabel("Dice NO\(index+1), Facing side: \(self.viewModel.state.dices[index].number)")
                        .accessibilityHint("Total Sides: \(self.viewModel.state.dices[index].sides)")
                    }

                    Button {
                        if !viewModel.state.dices.isEmpty {
                            if self.isTimerRunning {
                                self.stopTimer()
                                self.startTimer()
                            } else {
                                self.startTimer()
                            }
                        } else {
                            showingAlert = true
                        }
                    } label: {
                        Text("Roll")
                    }
                    .onReceive(self.timer) { m in
                        print(m)
                        withAnimation {
                            self.viewModel.roll()
                            hapticManager.complexSuccess()
                        }
                        self.timeRemaining -= 0.1
                        if self.timeRemaining < 0 {
                            self.stopTimer()
                            self.viewModel.saveHistory()
                        }
                    }
                    .alert("Can't Roll Dice", isPresented: $showingAlert) {
                        Button("OK", role: .none) {}
                    } message: {
                        Text("There is no dice to roll!")
                    }
                }

                Section {
                    ForEach(self.viewModel.state.history, id: \.self) { hist in
                        Text("\(hist)")
                            .font(.callout)
                            .multilineTextAlignment(.leading)
                    }
                } header: {
                    HStack {
                        Text("History")
                        Spacer()
                        Button {
                            viewModel.clearHistory()
                        } label: {
                            Text("Clear History")
                        }
                    }
                }
            }
            .navigationTitle("DiceRoller")
            .onAppear {
                self.stopTimer()
            }
            .sheet(isPresented: self.$isSheetPresenterd) {
                ChooseDiceView(viewModel: self.viewModel)
            }
            .toolbar {
                Button {
                    self.isSheetPresenterd = true
                } label: {
                    Label("Add Dice", systemImage: "plus.app")
                }
            }
            .onAppear(perform: hapticManager.prepareHaptics)
        }
    }

    func stopTimer() {
        self.timer.upstream.connect().cancel()
        self.isTimerRunning = false
        self.timeRemaining = 1
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
