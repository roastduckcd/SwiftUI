//
//  LandmarkRow.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/7/31.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {

    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image()
                .resizable()
                .frame(width: 50, height: 50)

            Text(landmark.name)

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.orange)
            }
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: DataManager.landmarkData[0])
                // 修改Xcode预览界面的大小

            LandmarkRow(landmark: DataManager.landmarkData[1])
                // 修改Xcode预览界面的大小
                
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
