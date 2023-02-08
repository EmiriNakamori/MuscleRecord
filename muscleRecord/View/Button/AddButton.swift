//
//  AddButton.swift
//  muscleRecord
//
//  Created by nakamori on 2022/12/10.
//

import SwiftUI

struct AddButton: View {
    @State private var page: Int? = 0
    var body: some View {

            VStack {

                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: RecordView(), tag: 1, selection: $page){
                        EmptyView()
                    }
                        Button(action: {
                            self.page = 1
                        }, label: {
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        })
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .cornerRadius(30.0)
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0))

                }
            }
        

    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
