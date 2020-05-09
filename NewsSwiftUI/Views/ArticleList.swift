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
    @State var size: CGFloat = 0.5
    
    var repeatingAnimation: Animation{
        Animation.spring().repeatForever()
    }
    
    var body: some View {
        NavigationView{
            
            if appState.loading {
                
            }else{}
            
            GeometryReader{
                geo in
                if self.appState.loading{
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Image(systemName: "doc.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaleEffect(self.size)
                            .onAppear {
                                withAnimation(self.repeatingAnimation) {
                                    self.size = 1.0
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    
                }else{
                    ScrollView(.vertical){
                        VStack {
                            ForEach(self.appState.articles){
                                article in
                                NavigationLink(destination: ArticleDetail(article: article, appState: ArticleDetailAppState())){
                                    ArticleRow(article: article).frame(height: 300)
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                        .frame(width: geo.size.width)
                    }.frame(width: geo.size.width,height: geo.size.height)
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
