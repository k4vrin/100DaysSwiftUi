//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Mostafa Hosseini on 6/21/23.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    @ViewBuilder let content: (T) -> Content
    
    
    init(predicate: Predicate = .beginsWith(caseSensetive: true), sortDesc: [NSSortDescriptor] , filterKey: String, filterValue: String, content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDesc, predicate: NSPredicate(format: "%K \(predicate.description) %@", filterKey, filterValue))
        self.content = content
    }
    
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
}


enum Predicate: CustomStringConvertible {
    var description: String {
        switch self {
        case .beginsWith(let caseSensetive):
            if caseSensetive {
                return "BEGINSWITH"
            } else {
                return "BEGINSWITH[c]"
            }
        case .endsWith(let caseSensetive):
            if caseSensetive {
                return "ENDSWITH"
            } else {
                return "ENDSWITH[c]"
            }
        case .inside: return "IN"
        case .lesser: return "<"
        case .greater: return ">"
        case .contain(let caseSensetive):
            if caseSensetive {
                return "CONTAINS"
            } else {
                return "CONTAINS[c]"
            }
        }
    }
    case beginsWith(caseSensetive: Bool)
    case endsWith(caseSensetive: Bool)
    case inside
    case lesser
    case greater
    case contain(caseSensetive: Bool)
}
