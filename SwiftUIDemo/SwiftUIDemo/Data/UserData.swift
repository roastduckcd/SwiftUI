//
//  UserData.swift
//  SwiftUIDemo
//
//  Created by yang song on 2019/8/1.
//  Copyright © 2019 yangsong. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {

    @Published var showFavoritesOnly = false
    @Published var landmarks = DataManager.landmarkData

//      BindableObject 协议已废弃
//    typealias PublisherType = PassthroughSubject
//    let willChange = PassthroughSubject<UserData, Never>()
//
//    var showFavoritesOnly = false {
//        didSet {
//            willChange.send(self)
//        }
//    }
//
//    var landmarks = DataManager.landmarkData {
//        didSet {
//            willChange.send(self)
//        }
//    }
}

