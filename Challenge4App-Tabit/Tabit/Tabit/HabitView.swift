//
//  HabitView.swift
//  Tabit
//
//  Created by Mostafa Hosseini on 5/28/23.
//

import SwiftUI

struct HabitView: View {
    let act: Activity
    @ObservedObject var viewModel: MainViewModel
    
    init(act: Activity, viewModel: MainViewModel) {
        self.act = act
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(act.title)
                    .font(.largeTitle)
                
                Text(act.description)
                
                Text("Completed days: \(act.trackedDays)")
                
                Spacer()
                
                Button {
                    viewModel.addOneDay(id: act.id)
                } label: {
                    Text("Complete 1 day")
                }
                
                Spacer()
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(act: Activity(title: "", description: "", trackedDays: 0), viewModel: MainViewModel())
    }
}
