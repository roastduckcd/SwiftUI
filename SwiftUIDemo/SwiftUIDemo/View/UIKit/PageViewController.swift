//
//  PageViewController.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/2.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI

struct PageViewController: UIViewControllerRepresentable {

    var controllers: [UIViewController]
    @Binding var currentPage: Int

    // 调用 makeUIViewController 前先调用
    func makeCoordinator() -> PageVCCoordinator {
        PageVCCoordinator(pageViewController: self)
    }

    // SwiftUI 显示视图时，调用该函数一次，获取 VC 实例并开始管理生命周期。
    func makeUIViewController(context: UIViewControllerRepresentableContext<PageViewController>) -> UIPageViewController {
        print("来了 page vc")

        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageController.dataSource = context.coordinator
        pageController.delegate = context.coordinator
        return pageController
    }

    func updateUIViewController(_ uiViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PageViewController>) {

        // [controllers[0]] 只用一个元素的数组
        uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true) { (completed) in
            print("切换完成")
        }
    }

}

class PageVCCoordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

        var parent: PageViewController

        init(pageViewController: PageViewController) {
            self.parent = pageViewController
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return parent.controllers.last
            }
            return parent.controllers[index - 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            return parent.controllers[index + 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

            if completed,
                let visibleVC = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleVC)
            {
                // 需要实时响应的视图才使用 ＄
                parent.currentPage = index
            }
        }

    }


