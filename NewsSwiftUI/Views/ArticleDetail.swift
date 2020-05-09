//
//  ArticleDetail.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 09-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import SwiftUI

struct ArticleDetail: View {
    
    @State var article: Article
    
    var body: some View {
        ArticleWebView(article: article)
        .navigationBarTitle(Text(article.title))
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static let article = Article(JSON: [
        "author": "unnamed",
        "title": "Live Coronavirus News Updates - The New York Times",
        "description": "Another 3.2 million people filed for unemployment benefits. A new study found that nearly everyone who gets the disease eventually makes antibodies to the virus. The governor of Texas said people would not be jailed for defiantly reopening businesses.",
        "url": "https://www.nytimes.com/2020/05/07/us/coronavirus-updates-cases-deaths.html",
        "urlToImage": "https://www.nytimes.com/newsgraphics/2020/04/09/corona-virus-social-images-by-section/assets/US_promo.jpg?u=1588884226301",
        "publishedAt": "2020-05-07T20:47:18Z",
        "content": "Heres what you need to know:\r\nA copy of the C.D.C. guidance obtained by The New York Times includes sections for child care programs, schools and day camps, churches and other communities of faith, employers with vulnerable workers, restaurants and bars, and … [+32597 chars]"
    ])!
    static var previews: some View {
        ArticleDetail(article: Self.article)
    }
}
