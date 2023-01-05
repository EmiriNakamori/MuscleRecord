//
//  CalendarView.swift
//  muscleRecord
//
//  Created by nakamori on 2023/01/05.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        List(0..<5) { item in
            Text("list of 5 item")
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
