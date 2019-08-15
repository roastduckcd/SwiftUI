//
//  RotatedBadgeSymbol.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/2.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle

    var body: some View {
        BadgeSymbol()
            // FIXME:　FIXME - 不偏移，就要调整 x, y？？
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
            .opacity(0.5)
    }
}

#if DEBUG
struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
#endif
