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
        NavigationView {
            VStack {

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

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
