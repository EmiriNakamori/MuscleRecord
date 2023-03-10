//
//  GoogleSignInButtonView.swift
//  muscleRecord
//
//  Created by nakamori on 2023/03/10.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct GoogleSignInButtonView: View {

    var body: some View {
        Text("hallow")
        Button {
            handleSignInButton()
        } label: {
            Text("aa")
        }
    }
}

func handleSignInButton() {
    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
        return
    }
    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
        if error != nil {
            print("ログイン失敗")
        }

        if signInResult != nil {
            print("ログイン成功")
        }

    }
}

struct GoogleSignInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInButtonView()
    }
}
