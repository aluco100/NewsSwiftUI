//
//  GradientRectangle.swift
//  NewsSwiftUI
//
//  Created by Mavericks's iOS Dev on 08-05-20.
//  Copyright © 2020 Mavericks. All rights reserved.
//

import SwiftUI

struct GradientRectangle: View {
    var body: some View {
        Rectangle().foregroundColor(Color(UIColor.black.withAlphaComponent(0.43))).background(LinearGradient(gradient: Gradient(colors: [.black, Color(UIColor.black.withAlphaComponent(0.0))]), startPoint: .bottom, endPoint: .top))
    }
}

struct GradientRectangle_Previews: PreviewProvider {
    static var previews: some View {
        GradientRectangle()
    }
}
