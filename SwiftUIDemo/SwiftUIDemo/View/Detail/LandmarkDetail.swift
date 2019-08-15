//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/7/30.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {

    var landmark: Landmark
    @EnvironmentObject var userData: UserData
    var landmarkIndex: Int {
        // 根据传入的landmark获取它在landmarkData数组中的索引
        // 多此一举？？？？如果只是展示数据，不做修改确实是
        // 如果需要修改数据，比如下面的是否收藏 isFavorite
        //  使用landmark不能将视图更改通知到数据模型
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }


    var body: some View {
//        NavigationView {
            VStack(alignment: .center, spacing: 0) {

                MapView(coordinate: userData.landmarks[landmarkIndex].locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                //.padding(.top, 44) 自动多偏移导航栏高度？？

                CircleImage(image: userData.landmarks[landmarkIndex].image())
                    .offset(y: -130)
                    .padding(.bottom, -130)

                HStack(alignment: .bottom, spacing: 10) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .foregroundColor(.green)
                                .font(.title)
                            
                            Button(action: {
//                                self.userData.landmarks[self.landmarkIndex].isFavorite = !self.userData.landmarks[self.landmarkIndex].isFavorite
                                self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                            }) {
                                if self.userData.landmarks[self.landmarkIndex].isFavorite {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.orange)
                                } else {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        Text(landmark.park)
                            .font(.subheadline)
                    }.foregroundColor(.blue)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }.padding()

                Spacer()
            }.navigationBarTitle(Text(landmark.name), displayMode: .inline)
//        }
    }

}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: DataManager.landmarkData[0])
    }
}
#endif
