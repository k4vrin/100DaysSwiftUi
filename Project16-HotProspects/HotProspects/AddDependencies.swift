//
//  AddDependencies.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/3/23.
//

import SwiftUI
import SamplePackage


struct AddDependencies: View {
    
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

struct AddDependencies_Previews: PreviewProvider {
    static var previews: some View {
        AddDependencies()
    }
}
