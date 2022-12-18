//
//  PageMenu.swift
//  muscleRecord
//
//  Created by nakamori on 2022/12/10.
//

import SwiftUI

struct PageMenuItem {
    var title: String
    var color: Color
    var content: AnyView

    init<Content: View>(title: String, color: Color, content: Content) {
      self.title = title
      self.color = color
      self.content = AnyView(content)
    }
}

struct PageMenu: View {
    @Binding var selection: Int
    var items: [PageMenuItem]

    init(selection: Binding<Int>, items: [PageMenuItem]) {
        self._selection = selection
        self.items = items
    }
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack(alignment: .bottom, spacing: 0) {
                        ForEach(0..<items.count, id: \.self) { index in
                            Spacer()
                            PageMenuTab(
                                title: items[index].title,
                                background: items[index].color,
                                active: index == selection) {
                                    selection = index
                                    withAnimation {
                                        proxy.scrollTo(index)
                                    }
                                }
                                .id(index)
                        }
                    }
                }

                TabView(selection: $selection) {
                    ForEach(0..<items.count, id: \.self) {
                        items[$0].content.tag($0)
                    }
                }
                .onChange(of: selection) { index in
                    withAnimation {
                        proxy.scrollTo(index)
                    }
                }
                .tabViewStyle(.page)
                .menuIndicator(.hidden)
                .animation(.easeOut(duration: 0.2), value: selection)
            }
        }
    }

}

struct PageMenu_Previews: PreviewProvider {
    @State static var selection = 0
    static var items = [
        PageMenuItem(title: "月", color: .purple, content: DayView()),
        PageMenuItem(title: "火", color: .red, content: DayView()),
        PageMenuItem(title: "水", color: .pink, content: DayView()),
        PageMenuItem(title: "木", color: .blue, content: DayView()),
        PageMenuItem(title: "金", color: .blue, content: DayView()),
        PageMenuItem(title: "土", color: .blue, content: DayView()),
        PageMenuItem(title: "日", color: .blue, content: DayView())
    ]
    static var previews: some View {
        PageMenu(selection: $selection, items: items)
    }
}
