//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/5/23.
//

import CodeScanner
import SwiftUI
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }

    enum SortType {
        case name, mostRecent
    }
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var isSortDialogShowing = false
    @State private var sortOrder = SortType.mostRecent
    @State private var filteredProspects: [Prospect] = []
    
    let filter: FilterType
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        if case .none = filter, prospect.isConected {
                            Image(systemName: "hand.thumbsup.circle")
                        }
                    }
                    .swipeActions {
                        if prospect.isConected {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                prospects.toggle(prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                            
                            Button {
                                addNotification(for: prospect)
                            } label: {
                                Label("Remind me", systemImage: "bell")
                            }
                            .tint(.orange)
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    isShowingScanner = true
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
                Button {
                    isSortDialogShowing = true
                } label: {
                    Label("Scan", systemImage: "slider.horizontal.3")
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(
                    codeTypes: [.qr],
                    simulatedData: "Paul Hudson\npaul@hackingwithswift.com",
                    completion: handleScan
                )
            }
            .confirmationDialog("Sort order", isPresented: $isSortDialogShowing) {
                Button {
                    sortOrder = .name
                } label: {
                    Text("By name")
                }
                Button {
                    sortOrder = .mostRecent
                } label: {
                    Text("By most recent")
                }
                Button("Cancel", role: .cancel) {}
            }
            .onAppear(perform: updateList)
            .onChange(of: sortOrder) { _ in updateList() }
            .animation(.default, value: sortOrder)
        }
    }
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    func updateList() {
        // pass a predicate to this method that returns true when the first element should be ordered before the second.
        func sortF(el1: Prospect, el2: Prospect) -> Bool {
            switch sortOrder {
            case .name:
                // the second element should be bigger than first. ascending order
                return el2.name > el1.name
            case .mostRecent:
                return true
            }
        }
        
        switch filter {
        case .none:
            filteredProspects = prospects.people.sorted(by: sortF)
        case .contacted:
            filteredProspects = prospects.people.filter { $0.isConected }.sorted(by: sortF)
        case .uncontacted:
            filteredProspects = prospects.people.filter { !$0.isConected }.sorted(by: sortF)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let res):
            let details = res.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            prospects.add(person)
        case .failure(let err):
            print("Scanning failed: \(err.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, _ in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh!")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
