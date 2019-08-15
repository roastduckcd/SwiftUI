//
//  BadgeBackground.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/2.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct Badge: View {

    static let rotationCount = 8

    var badgeSymbols: some View {

        ForEach(0..<8) { i in
            RotatedBadgeSymbol(
                angle:Angle(degrees: 360.0 / Double(8) * Double(i))
            )
        }
    }

    var body: some View {
        ZStack {
            BadgeBackground()

            GeometryReader { (geometry) in
                self.badgeSymbols
                    .scaleEffect(1 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }.scaledToFit()
    }
}

#if DEBUG
struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
#endif
