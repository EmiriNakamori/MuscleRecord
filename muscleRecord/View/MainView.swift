//
//  MainView.swift
//  muscleRecord
//
//  Created by nakamori on 2022/12/03.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            RecordView()
                .tabItem {
                    VStack {
                        Image(systemName: "pencil.and.outline")
                        Text("Record")
                    }
                }.tag(1)
            ResultView()
                .tabItem {
                    VStack {
                        Image(systemName: "chart.bar.xaxis")
                        Text("Result")
                    }.tag(2)
                }
        }
    }
}

struct MainViewView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
