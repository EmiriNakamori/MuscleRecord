//
//  GoogleButtonViewController.swift
//  muscleRecord
//
//  Created by nakamori on 2023/03/10.
//

import Foundation
import GoogleSignIn
import SwiftUI

struct SignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        let button = GIDSignInButton()
        button.colorScheme = .light
        return button
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
