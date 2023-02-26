//
//  RecordDataStore.swift
//  muscleRecord
//
//  Created by nakamori on 2023/02/26.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

final class RecordDataStore {
    static let shared = RecordDataStore()
    let db = Firestore.firestore()
    func createUser(name: String) {
//        guard let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
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

    func sendRecord(eventName: String) {
//        guard let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
        let data: [String: Any] = [
            "part": 2,
            "event_name": eventName
        ]
        db.collection("users").document().collection("records").document().setData(data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Success adding document")
            }
        }
    }
}
