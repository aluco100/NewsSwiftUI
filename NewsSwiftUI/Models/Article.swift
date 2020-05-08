//
//  Article.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import Foundation
import ObjectMapper

struct Article: Mappable, Identifiable {
    let id: UUID = UUID()
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    
    init?(map: Map) {
        self.author = ""
        self.title = ""
        self.description = ""
        self.url = ""
        self.urlToImage = ""
        self.publishedAt = ""
        self.content = ""
    }
    
    mutating func mapping(map: Map) {
        author<-map["author"]
        title<-map["title"]
        description<-map["description"]
        url<-map["url"]
        urlToImage<-map["urlToImage"]
        publishedAt<-map["publishedAt"]
        content<-map["content"]
    }
}
