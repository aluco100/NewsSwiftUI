//
//  ArticleList.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import SwiftUI

struct ArticleList: View {
    
    @ObservedObject var appState: ArticlesAppStates
    var interactor: ArticlesInteractor
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                VStack{
                    ForEach(appState.articles){
                        article in
                        ArticleRow(article: article).frame(height: 300)
                    }
                }
            }
            .onAppear{
                self.interactor.retrieveArticles()
            }.navigationBarTitle(Text("Articulos"))
        }
        
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList(appState: Self.appState, interactor: ArticlesInteractor(appState: Self.appState))
    }
    static let appState = ArticlesAppStates()
}
