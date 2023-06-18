//
//  AddBook.swift
//  Bookworm
//
//  Created by Mostafa Hosseini on 6/6/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var review = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    private var isSaveEnable: Bool {
        self.title.isBlank() || self.author.isBlank()
    }
    
    let genres = ["Fantasy", "Horor", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date.now
                        
                        try? moc.save()
                        dismiss()
                    }
                    .disabled(isSaveEnable)
                }
            }
            .navigationTitle("Add Book")
            .animation(.default, value: rating)
        }
    }
    
}

struct AddBook_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

extension String {
    func isBlank() -> Bool {
        self.isEmpty || self.allSatisfy { ch in
            ch.isWhitespace
        }
    }
}
