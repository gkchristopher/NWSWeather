//
//  IconImageView.swift
//
//  Created by Christopher Moore on 11/13/21.
//

import SwiftUI

struct IconImageView: View {
    
    @StateObject var vm: IconImageViewModel
    
    init(urlString: String, iconName: String) {
        _vm = StateObject(wrappedValue: IconImageViewModel(urlString: urlString, iconName: iconName))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        IconImageView(urlString: dev.period1.icon, iconName: dev.period1.iconImageName)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
