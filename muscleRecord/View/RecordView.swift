//
//  RecordView.swift
//  muscleRecord
//
//  Created by nakamori on 2022/12/10.
//

import SwiftUI

struct RecordView: View {
    @State private var selection = 0
    let items = [
        PageMenuItem(
            title: "月",
            color: .blue,
            content: DayView()
        ),
        PageMenuItem(
            title: "火",
            color: .blue,
            content: DayView()
        ),
        PageMenuItem(
            title: "水",
            color: .blue,
            content: DayView()
        ),
        PageMenuItem(
            title: "木",
            color: .blue,
            content: DayView()
        ),
        PageMenuItem(
            title: "金",
            color: .blue,
            content: DayView()
        ),
        PageMenuItem(
            title: "土",
            color: .blue,
            content: DayView()
        ),
        PageMenuItem(
            title: "日",
            color: .blue,
            content: DayView()
        )
    ]
    var body: some View {
        ZStack {
            GeometryReader { reader in
                Color.blue
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
            Color.blue
            PageMenu(selection: $selection, items: items)
                .padding(.top, 50)
            VStack {
                Text("１.上がカレンダーでスクロールできる")
                Text("2.メニュー登録の一覧が見れる")
                Text("3.記録画面に遷移できるボタン用意")
                Text("DBはFireStoreを使う")
            }
            AddButton()
        }
    }
    
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
