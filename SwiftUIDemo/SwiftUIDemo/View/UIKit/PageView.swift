//
//  PageView.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/2.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {

    @State var currentPage = 0

    var viewControllers: [UIHostingController<Page>]

    init(views: [Page]) {
        viewControllers = views.map {
            UIHostingController(rootView: $0)
        }
    }

    var body: some View {
        ZStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.bottom)

        }
    }
}

#if DEBUG
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(views: [Text("")])
    }
}
#endif
