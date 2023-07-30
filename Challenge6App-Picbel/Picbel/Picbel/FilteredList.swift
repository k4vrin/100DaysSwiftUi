//
//  FilteredList.swift
//  Picbel
//
//  Created by Mostafa Hosseini on 7/30/23.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var fetchRequest: FetchedResults<T>
    @ViewBuilder let content: (T) -> Content
    
    
    init(sortDesc: [NSSortDescriptor] , content: @escaping (T) -> Content) {
//        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDesc, predicate: NSPredicate(format: "%K \(predicate.description) %@", filterKey, filterValue))
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDesc)
        self.content = content
    }
    
    
    var body: some View {
        List {
            ForEach(fetchRequest, id: \.self) { item in
                self.content(item)
            }
            .onDelete(perform: deleteBooks)
        }
        
    }
    
    func deleteBooks(at offsets: IndexSet) {
            for offset in offsets {
                let value = fetchRequest[offset]
                moc.delete(value)
            }
            
            try? moc.save()
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
