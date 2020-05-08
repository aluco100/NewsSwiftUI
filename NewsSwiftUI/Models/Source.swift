//
//  Source.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import Foundation
import ObjectMapper

struct Source: Mappable {
    var id: String
    var name: String
    
    init?(map: Map) {
        self.id = ""
        self.name = ""
    }
    
    mutating func mapping(map: Map) {
        id<-map["id"]
        name<-map["name"]
    }
}
