//
//  WorkWithString.swift
//  WordScramble
//
//  Created by Mostafa Hosseini on 4/17/23.
//

import SwiftUI

struct WorkWithString: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }

    func test() {
        let input = """
        a
        b
        c
        """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func test2() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRang = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRang.location == NSNotFound
    }
}

struct WorkWithString_Previews: PreviewProvider {
    static var previews: some View {
        WorkWithString()
    }
}
