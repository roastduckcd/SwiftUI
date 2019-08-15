//
//  TempPushView.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/15.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct TempPushView: View {

    @EnvironmentObject var userData: UserData
    let data = [
        1,
        2,
        3
    ]

    var items: [Landmark]

    var body: some View {
        // List 导致 NavigationLink 失效
        List {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(self.items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetail(
                                landmark: landmark
                            )
                        ) {
                            CategoryItem(landmark: landmark)
                        }

                    }
                }
            }
        }
    }
}

