//
//  CategoryRow.swift
//  App-Design-and-Layout
//
//  Created by 王炜 on 2019/6/9.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 5)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(self.items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetail(
                                landmark: landmark
                            ).environmentObject(UserData())
                        ) {
                            CategoryItem(landmark: landmark)
                        }

                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark
                .image()
                .resizable()
                .renderingMode(.original)
                .frame(width: 155, height: 155)
                .cornerRadius(5)

            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
            }
            .padding(.leading, 15)
    }
}

#if DEBUG
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: DataManager.landmarkData[0].category.rawValue,
            items: Array(DataManager.landmarkData.prefix(4))
        )
    }
}
#endif
