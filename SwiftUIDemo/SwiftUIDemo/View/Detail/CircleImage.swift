//
//  CircleImage.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/7/30.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct CircleImage: View {

    var image: Image

    var body: some View {
        Image("turtlerock")
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.green, lineWidth: 5))
            .shadow(color:.red, radius: 10, x: 0, y: 0)
    }
}

#if DEBUG
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image(""))
    }
}
#endif
