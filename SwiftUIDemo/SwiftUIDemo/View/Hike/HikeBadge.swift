//
//  HikeBadge.swift
//  App-Design-and-Layout
//
//  Created by 王炜 on 2019/6/9.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                // 缩小的是内容，frame 不变，导致和Text有留白
                // 所以后面调整了frame
                .scaleEffect(1.0 / 3.0)
                // 两次 frame 的调用使得视图在初始尺寸300*300的缩放窗格中渲染
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

#if DEBUG
struct HikeBadge_Previews : PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
#endif
