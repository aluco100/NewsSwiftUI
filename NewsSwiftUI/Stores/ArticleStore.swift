//
//  ArticleStore.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import Foundation

//MARK: - Store Protocol Definition
protocol ArticleStoreProtocol: class {
    func fetchTopArticles(result: @escaping ArticleStoreCompletion)
}


//MARK: - TypeAlias
typealias ArticleStoreCompletion = (ArticleStoreResult)->Void

//MARK: - Result
enum ArticleStoreResult {
    case success(articles: [Article])
    case failure(error: Error)
}
