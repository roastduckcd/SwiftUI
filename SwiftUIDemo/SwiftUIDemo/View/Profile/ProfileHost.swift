//
//  ProfileHost.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/2.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {

    @Environment(\.editMode) var mode

    @State var profile = Profile.default

    // 临时副本，先修改这个，再同步到 profile
    @State var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            HStack {

                if self.mode?.value == .active {
                    Button(action: {
                        // 点击确认再将更改同步到模型
                        self.profile = self.draftProfile
                        self.mode?.animation().value = .inactive
                    }) {
                        Text("确认")
                    }
                }

                Spacer()

                EditButton()
            }
            if self.mode?.value == .inactive {
                ProfileSummary(profile: profile)
            } else {
                // 编辑时先使用草稿保存
                ProfileEditor(profile: $draftProfile)
                    .onDisappear {
                        self.draftProfile = self.profile
                }
            }
        }
        .padding()
    }
}

#if DEBUG
struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
#endif
