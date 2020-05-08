//
//  ArticleImage.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 07-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import SwiftUI

struct ArticleImage: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    var body: some View {
        Image(uiImage: imageLoader.image ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .onAppear {
            self.imageLoader.load()
        }.onDisappear {
            self.imageLoader.cancel()
        }
    }
}

struct ArticleImage_Previews: PreviewProvider {
    static var previews: some View {
        ArticleImage(imageLoader: ImageLoader(url: URL(string: "https://www.newzealand.com/assets/Operator-Database/27993bb8a3/img-1536190805-6985-30507-p-06F32FED-F909-FACC-132BD828B851D7E9-2544003__aWxvdmVrZWxseQo_CropResizeWzUwMCxudWxsLDg1LCJqcGciXQ.jpg")!)).frame(height: 300).previewLayout(.fixed(width: 500, height: 300))
    }
}
