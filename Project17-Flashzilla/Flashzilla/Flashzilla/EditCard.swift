//
//  EditCard.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/15/23.
//

import SwiftUI

struct EditCard: View {
    static let editCardKey = "FlashzillaCards"
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent(EditCard.editCardKey)


    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                Section {
                    ForEach(0 ..< cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
        }
    }

    func done() {
        dismiss()
    }

    func saveData() {
//        if let encoded = try? JSONEncoder().encode(cards) {
//            UserDefaults.standard.set(encoded, forKey: EditCard.editCardKey)
//        }
        
        do {
            let encoded = try JSONEncoder().encode(cards)
            try encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data: \(error.localizedDescription)")
        }
    }

    func loadData() {
//        if let data = UserDefaults.standard.data(forKey: EditCard.editCardKey) {
        if let data = try? Data(contentsOf: savePath) {
            if let decode = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decode
            }
        }
    }

    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard !trimmedPrompt.isEmpty && !trimmedAnswer.isEmpty else { return }
        newAnswer = ""
        newPrompt = ""
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }

    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct EditCard_Previews: PreviewProvider {
    static var previews: some View {
        EditCard()
    }
}
