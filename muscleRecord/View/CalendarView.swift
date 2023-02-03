//
//  CalendarView.swift
//  muscleRecord
//
//  Created by nakamori on 2023/01/05.
//

import SwiftUI

struct CalendarView: View {

    @State private var date = Date()
    var body: some View {
        VStack {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .environment(\.locale, Locale(identifier: "ja_JP"))
            .scaleEffect(x: 0.9, y: 0.9)
            TrainingRecordView()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
