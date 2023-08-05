//
//  SwiftResult.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/2/23.
//

import SwiftUI

struct SwiftResult: View {
    
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
//    func fetchReadings() async {
//        do {
//            let url = URL(string: "https://hws.dev/readings.json")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let readings = try JSONDecoder().decode([Double].self, from: data)
//            output = "Found \(readings.count) readings."
//        } catch {
//            print("Download error")
//        }
//    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings."
        }
        
        let result: Result<String, Error> = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let err):
            output = "Download error: \(err.localizedDescription)"
        }
    
    }
}

struct SwiftResult_Previews: PreviewProvider {
    static var previews: some View {
        SwiftResult()
    }
}
