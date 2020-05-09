//
//  ArticleWebView.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 09-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import SwiftUI
import UIKit
import WebKit

struct ArticleWebView: UIViewRepresentable {
    
    @State var article: Article
    
    let webview = WKWebView()
    
    func makeUIView(context: UIViewRepresentableContext<ArticleWebView>) -> WKWebView {
        self.webview.navigationDelegate = context.coordinator
        if let url = URL(string: article.url){
            self.webview.load(URLRequest(url: url))
        }
        return self.webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<ArticleWebView>) {
        return
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        private var article: Article
        
        init(article: Article){
            self.article = article
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            
        }
    }
    
    func makeCoordinator() -> ArticleWebView.Coordinator {
        return Coordinator(article: article)
    }
    
}
