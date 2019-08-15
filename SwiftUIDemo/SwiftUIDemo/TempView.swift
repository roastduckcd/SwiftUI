//
//  TempView.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/7/31.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI
import Foundation


/// 测试部分功能
struct TempView: View {

    static let gradientStart = Color(red: 1, green: 1, blue: 1)
    static let gradientEnd = Color(red: 0, green: 0, blue: 0)

    let data = [
        "aaa",
        "bbb",
        "ccc"
    ]
    

    var body: some View {

        NavigationView {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(data, id: \.self) { letters in
                        NavigationLink(destination: TempPushView(items: DataManager.landmarkData).environmentObject(UserData())) {
                            Text(letters)
                        }
                    }
                }
            }.frame(height: 100)
        }
    }
}

func dubleFrameUsage() -> some View {
    VStack(alignment: .center) {
        Circle().strokeBorder()
            .frame(width: 300, height: 300)
            // 缩小的是内容，frame 不变，导致和Text有留白
            // 所以后面调整了frame
            .scaleEffect(1.0 / 3.0)
            .frame(width: 100, height: 100)
        Text("name")
            .font(.caption)
            .accessibility(label: Text("Badge for name"))
    }
}
