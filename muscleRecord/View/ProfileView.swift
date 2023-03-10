//
//  ProfileView.swift
//  muscleRecord
//
//  Created by nakamori on 2023/02/26.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift

struct ProfileView: View {
    @State private var isPresented: Bool = false
    @State private var name = ""
    var body: some View {
        VStack {
//            TextField("name", text: $name)
//                .frame(width: 200, height: 30)
//            Button(action: {
//                isPresented = true
//
//
//                RecordDataStore.shared.createUser(name: name)
//            }) {
//                Text("登録")
//            }
//            .frame(width: 200, height: 30)
//            .background(Color.blue)
//            .foregroundColor(Color.white)
//            .fullScreenCover(isPresented: $isPresented) {
//                MainView()
//            }

            
        }


    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
