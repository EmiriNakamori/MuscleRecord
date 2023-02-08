//
//  TrainingRecordView.swift
//  muscleRecord
//
//  Created by nakamori on 2023/02/03.
//

import SwiftUI

struct TrainingRecordView: View {
    let item = ["レッグプレス", "レッグエクステンション", "インナーサイ", "アウターサイ"]
    var body: some View {
        VStack {
            List {
                Section {
                    ForEach(0..<item.count, id: \.self) { index in
                        Text(item[index])
                    }
                } header: {
                    Text("足")
                }

                Section {
                    ForEach(0 ..< item.count, id: \.self) { index in
                        Text(item[index])
                    }
                } header: {
                    Text("胸")
                }
            }
            .font(.system(size: 20))
        }
        .frame(width: 350, height: 250)
            .background(Color.white)
            .clipped()
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.7), radius: 5, x: 10, y: 10)

    }
}

struct TrainingRecordView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingRecordView()
    }
}
