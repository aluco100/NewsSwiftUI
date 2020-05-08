//
//  ArticlesAppState.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import Foundation

class ArticlesAppStates: ObservableObject {
    @Published var articles: [Article] = []
    @Published var loading: Bool = true
}
