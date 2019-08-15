//
//  PageControl.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/2.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct PageControl: UIViewRepresentable {

    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> PageControlCoordinator {
        return PageControlCoordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {

        let control = UIPageControl()
//        control.backgroundColor = UIColor.purple
        control.pageIndicatorTintColor = UIColor.purple
        control.currentPageIndicatorTintColor = UIColor.orange
        control.numberOfPages = numberOfPages

        //
        control.addTarget(context.coordinator, action: #selector(PageControlCoordinator.updateCurrentPage(sender:)), for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {

        uiView.currentPage = currentPage
    }

}


class PageControlCoordinator: NSObject {
    var control: PageControl

    init(_ control: PageControl) {
        self.control = control
    }

    @objc func updateCurrentPage(sender: UIPageControl) {
        control.currentPage = sender.currentPage
    }
}

