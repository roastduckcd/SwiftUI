//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/7/31.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {

//    @State var showFavoritesOnly = true
    @EnvironmentObject var userData: UserData

    var body: some View {
    
        NavigationView {
            // FIXME:　FIXME - 几个构造函数的参数研究
            // FIXME:　FIXME - swift 类型转换、泛型 。。。
            // FIXME:　FIXME - ipad 不能显示？
            List {

                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Faourites Only")
                }

                ForEach(userData.landmarks) { landmark in

                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }.navigationBarTitle("Landmarks", displayMode: .large)
            }
        }
    }
}

#if DEBUG
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        /*
         ForEach 对集合的操作和 List 一样，也可以作为子控件。
            如果集合 data 中的元素遵循 Identifiable 协议的值，可以使用 \.self 来访问值
         ?? id 干啥的？？
         Place a ForEach instance inside a List or other container type to create a dynamic list.
         */
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                //  Xcode’s scheme menu 中的任意设备名
                // 指定设备
                .previewDevice(PreviewDevice(rawValue: deviceName))
                // 为预览视图添加标签
                .previewDisplayName(deviceName)
        }
    }
}
#endif
