//
//  ArticleRow.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import SwiftUI

struct ArticleRow: View {
    
    @State var article: Article
    
    var body: some View {
        ZStack{
            if article.urlToImage != ""{
                Rectangle().foregroundColor(Color(UIColor.black.withAlphaComponent(0.43))).background(LinearGradient(gradient: Gradient(colors: [.black, Color(UIColor.black.withAlphaComponent(0.0))]), startPoint: .bottom, endPoint: .top)).background(ArticleImage(imageLoader: ImageLoader(url: URL(string: article.urlToImage)!)))
            }else{
                Rectangle().foregroundColor(Color(UIColor.black.withAlphaComponent(0.43))).background(LinearGradient(gradient: Gradient(colors: [.black, Color(UIColor.black.withAlphaComponent(0.0))]), startPoint: .bottom, endPoint: .top))
            }
            
            VStack(alignment: .leading, spacing: 8.0){
                Text(article.author).font(.footnote).foregroundColor(.white)
                Text(article.title).font(.title).foregroundColor(.white)
                Text(article.description).font(.body).foregroundColor(.gray)
                Spacer()
            }
        }.padding(16.0)
    }
}

struct ArticleRow_Previews: PreviewProvider {
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
        
        ArticleRow(article: Self.article).frame(height: 300).previewLayout(.fixed(width: 500, height: 300))
    }
}
