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

    @State private var isSignIn = false
    var body: some View {
        Text("ログイン画面")
        Button {
            handleSignInButton()
            isSignIn.toggle()
        } label: {
            SignInButton()
        }
        .fullScreenCover(isPresented: $isSignIn) {
            MainView()
        }

    }
}

func handleSignInButton() {
    guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
        return
    }
    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
        guard error == nil else { return }
        guard let signInResult = signInResult else { return }

        signInResult.user.refreshTokensIfNeeded { user, error in
            guard error == nil else {
                return
            }
            guard let user = user else {
                return
            }
            guard let userToken = user.idToken?.tokenString else {
                return
            }
            guard let userId = user.userID else {
                return
            }
            guard let userName = user.profile?.name else {
                return
            }
            let resultUser = User(userId: userId, userToken: userToken, userName: userName)
            
            RecordDataStore.shared.user = resultUser
            RecordDataStore.shared.createUser(user: resultUser)
            
        }

    }
}

struct GoogleSignInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInButtonView()
    }
}
