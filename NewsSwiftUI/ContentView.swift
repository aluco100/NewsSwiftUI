//
//  ContentView.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    static let articleAppState = ArticlesAppStates()
    var body: some View {
        ArticleList(appState: Self.articleAppState,interactor: ArticlesInteractor(appState: Self.articleAppState))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
