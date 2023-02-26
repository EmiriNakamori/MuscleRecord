//
//  RecordDataStore.swift
//  muscleRecord
//
//  Created by nakamori on 2023/02/26.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

final class RecordDataStore {
    static let shared = RecordDataStore()
    func createUser(name: String) {
        let db = Firestore.firestore()
        guard let deviceId = UIDevice.current.identifierForVendor?.uuidString else {
            return
        }
        let data: [String: Any] = [
            "name": name,
            "UUID": deviceId,
            "createdAt": Timestamp(date: Date())
        ]

        db.collection("users").document().setData(data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Success adding document")
            }
        }
    }

    func sendRecord() {

    }
}
