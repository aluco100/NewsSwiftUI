//
//  ArticleAPIRepository.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ArticleAPIRepository: ArticleStoreProtocol {
    
    let apiKey: String = "d82c4383383a488cbc020d516d7031cc"
    
    //MARK: - Store Implementation
    
    func fetchTopArticles(result: @escaping (ArticleStoreResult) -> Void) {
        AF.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)", method: .get, parameters: nil).responseJSON(completionHandler: {
            response in
            guard response.error == nil else{
                result(ArticleStoreResult.failure(error: response.error!))
                return
            }
            guard let value = response.value as? [String : Any], let articles = value["articles"] as? Array<[String : Any]> else{
                return
            }
            let results = articles.map { (dict) -> Article? in
                let mapper = Mapper<Article>()
                return mapper.map(JSON: dict)
            }.compactMap({ $0 })
            result(ArticleStoreResult.success(articles: results))
        })
    }
    
}
