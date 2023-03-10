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
    var user: User? {
        didSet {
            createUser(user: user)
        }
    }
    func createUser(user: User?) {

        guard let user = user else {
            return
        }
        let data: [String: Any] = [
            "name": user.userName,
            "user_token": user.userToken,
            "createdAt": Timestamp(date: Date())
        ]

        db.collection("users").document(user.userId).setData(data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Success adding document")
            }
        }
    }

    func sendRecord(eventName: String) {
        guard let user = user else {
            return
        }
        let data: [String: Any] = [
            "part": 2,
            "event_name": eventName
        ]
        db.collection("users").document(user.userId).collection("records").document().setData(data) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Success adding document")
            }
        }
    }
}
