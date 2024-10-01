// Created by Prof. H in 2022
// Part of the PriceCheckFB project
// Using Swift 5.0
// Qapla'


import Combine
// import Firebase modules here
import FirebaseCore
import FirebaseFirestore

class LocationRepository: ObservableObject {
  // Set up properties here
    private let path: String = "location_scans"
    private let store = Firestore.firestore()
    
    @Published var locations: [Location] = []
  
  init() {
      self.get()
  }

    func get() {
      store.collection(path)
        .addSnapshotListener { querySnapshot, error in
          if let error = error {
            print("Error getting scans: \(error.localizedDescription)")
            return
          }

          self.locations = querySnapshot?.documents.compactMap { document in
            try? document.data(as: Location.self)
          } ?? []
        }
    }
    

  }
