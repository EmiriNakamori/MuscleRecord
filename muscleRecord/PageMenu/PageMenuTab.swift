//
//  PageMenuTab.swift
//  muscleRecord
//
//  Created by nakamori on 2022/12/12.
//

import SwiftUI

struct PageMenuTab: View {
    var title: String
    var background: Color
    var active = false
    var onClick: () -> Void = {}

    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text(title)
                    .foregroundColor(active ? .blue : .white)
                    .font(.system(size: 14, weight: .bold))
                    .padding(.horizontal)
                    .padding(.vertical)
                    .background(active ?
                                PageMenuRoundedCorners(
                                    color: .white,
                                    tl: 16,
                                    tr: 16,
                                    bl: 0,
                                    br: 0
                                ) :
                                    PageMenuRoundedCorners(
                                        color: background,
                                        tl: 16,
                                        tr: 16,
                                        bl: 0,
                                        br: 0
                                    )
                    )
                    .animation(.easeOut(duration: 0.2), value: active)
                    .onTapGesture {
                        onClick()
                    }
            }
        }

    }
}

struct PageMenuRoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    var body: some View {
        Color.blue
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height

                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)

                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}

struct PageMenuTab_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack(alignment: .center) {
                HStack(spacing: 0){
                    PageMenuTab(title: "月", background: .red)
                    PageMenuTab(title: "火", background: .purple)
                    PageMenuTab(title: "水", background: .pink)
                    PageMenuTab(title: "木", background: .blue)
                    PageMenuTab(title: "金", background: .blue)
                    PageMenuTab(title: "土", background: .blue)
                    PageMenuTab(title: "日", background: .blue)
                }
            }
        }
    }
}
