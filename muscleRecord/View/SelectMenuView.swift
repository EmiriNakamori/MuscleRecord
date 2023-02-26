//
//  SelectMenuView.swift
//  muscleRecord
//
//  Created by nakamori on 2023/02/08.
//

import SwiftUI

struct SelectMenuView: View {
    @State private var isPresented: Bool = false
    @State private var eventName = ""
    var body: some View {
        VStack {
            TextField("種目", text: $eventName)
                .frame(width: 200, height: 30)
            Button(action: {
                isPresented = true
                RecordDataStore.shared.sendRecord(eventName: eventName)
            }) {
                Text("記録する")
            }
            .frame(width: 200, height: 30)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .fullScreenCover(isPresented: $isPresented) {
                MainView()
            }
        }


    }
}

struct SelectMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SelectMenuView()
    }
}
