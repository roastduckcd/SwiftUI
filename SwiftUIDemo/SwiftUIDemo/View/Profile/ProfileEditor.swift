//
//  ProfileEditor.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/2.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {

    @Binding var profile: Profile

    var dateRange: ClosedRange<Date> {
        ClosedRange(uncheckedBounds: (
            // 往前一年的时间
            Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!,
            // 往后一年的时间
            Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        ))
    }

    var body: some View {

        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("user", text: $profile.username)
            }

            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }

            VStack(alignment: .leading, spacing: 20) {

                Text("Seasonal Photo").bold()
                Divider()
//                SegmentedControl(selection: $profile.seasonalPhoto) {
//                    // 自动补全背锅
//                    // xcode 11 beta 4 提示的是 AllCases
//                    // shit
//                    ForEach(Profile.Season.allCases, id: \.self) { (season) in
//                        Text(season.rawValue).tag(season)
//                    }
//                }
                Picker(selection: $profile.seasonalPhoto, label: Text("Picker")) {

                    ForEach(Profile.Season.allCases, id: \.self) { (season) in
                        Text(season.rawValue).tag(season)
                    }
                }
                VStack {
                    Text("Date Pick").bold()
                    DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                        // 描述date的用途，useless
                        Text("date")
                    }
                }
            }
        }

    }
}

#if DEBUG
struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
#endif
