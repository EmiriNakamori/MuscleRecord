//
//  MainView.swift
//  muscleRecord
//
//  Created by nakamori on 2022/12/10.
//

import SwiftUI

struct MainView: View {
    @State private var selectedIndex = 0

    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: self.$selectedIndex) {
                    Text("カレンダー")
                        .tag(0)
                    Text("グラフ")
                        .tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())

                if selectedIndex == 0 {
                    CalendarView()
                } else {
                    GraphView()
                }
                AddButton()
            }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
