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
    
    @ObservedObject var appState: ArticleDetailAppState
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
        
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        private var article: Article
        private var appState: ArticleDetailAppState
        
        init(article: Article,state: ArticleDetailAppState){
            self.article = article
            self.appState = state
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("CARGO")
            self.appState.loading = false
        }
    }
    
    func makeCoordinator() -> ArticleWebView.Coordinator {
        return Coordinator(article: article, state: appState)
    }
    
}
