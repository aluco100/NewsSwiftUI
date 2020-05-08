//
//  ArticlesInteractor.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import Foundation
import SwiftUI

protocol ArticlesBusinessLogic {
    var worker: ArticleStoreProtocol{get set}
    var appState: ArticlesAppStates{get set}
    func retrieveArticles()
}

struct ArticlesInteractor: ArticlesBusinessLogic {
    var worker: ArticleStoreProtocol = ArticleAPIRepository()
    var appState: ArticlesAppStates
    
    func retrieveArticles() {
        worker.fetchTopArticles { (result) in
            self.appState.loading = false
            switch result{
            case .failure(let error):
                //TODO
                break
            case .success(let articles):
                self.appState.articles = articles
                break
            }
        }
    }
}
