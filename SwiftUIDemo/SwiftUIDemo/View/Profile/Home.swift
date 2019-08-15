//
//  Home.swift
//  App-Design-and-Layout
//
//  Created by 王炜 on 2019/6/9.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: DataManager.landmarkData,
            by: { $0.category.rawValue }
        )
    }

    @State var showingProfile = false
    
    var featured: [Landmark] {
        DataManager.landmarkData.filter { $0.isFeatured }
    }

    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            // FIXME:　FIXME - List 和 NavigationLink 点击冲突, 暂时将List改为ScrollView
            ScrollView {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(categories.keys.sorted(), id: \.self) { (key)in

                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())

                NavigationLink(destination: LandmarkList().environmentObject(UserData())) {
                    Text("See All")
                }
            }
            .navigationBarTitle("Featured")
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                Text("User Profile")
                // Xcode11 beta 5 绘制图形时会造成app崩溃。苹果官网已有提示。
//                ProfileHost()
            }
            // MARK: - MARK - xcode11 beta 4
//            .navigationBarItems(trailing: NavigationLink(destination: ProfileHost(), label: {
//                    Image(systemName: "person.crop.circle")
//                        .imageScale(.large)
//                        .accessibility(label: Text("User Profile"))
//                        .padding()
//                }))
        }
    }
}


struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image().resizable()
    }
}

#if DEBUG
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome(showingProfile: true)
    }
}
#endif
