//
//  ChangeViewWEnum.swift
//  BucketList
//
//  Created by Mostafa Hosseini on 7/12/23.
//

import SwiftUI

struct ChangeViewWEnum: View {
    
    var loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

struct ChangeViewWEnum_Previews: PreviewProvider {
    static var previews: some View {
        ChangeViewWEnum()
    }
}


enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}


struct FailedView: View {
    var body: some View {
        Text("Failed😓")
    }
}
