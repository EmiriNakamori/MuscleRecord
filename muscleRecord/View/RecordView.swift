//
//  RecordView.swift
//  muscleRecord
//
//  Created by nakamori on 2022/12/10.
//

import SwiftUI

struct RecordView: View {
    @State private var selectedIndex = 0

    var body: some View {
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
        }

    }

    // SegmentedPicker Custom
    init() {
        guard let font = UIFont(name: "AvenirNext-Medium", size: 16) else {
            return
        }
        let whiteColor = UIColor.white
        let blueColor = UIColor.systemBlue

        UISegmentedControl.appearance().selectedSegmentTintColor = whiteColor
        UISegmentedControl.appearance().backgroundColor = blueColor

        UISegmentedControl.appearance().setTitleTextAttributes([
            .font: font,
            .foregroundColor: whiteColor,
        ], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([
                    .font: font,
                    .foregroundColor: blueColor,
                ], for: .selected)
    }
    
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
