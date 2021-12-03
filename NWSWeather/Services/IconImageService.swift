//
//  IconImageService.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/13/21.
//

import Foundation
import SwiftUI
import Combine

class IconImageService {
    
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    private let iconURLString: String
    private let iconName: String
    private let fileManager = LocalFileManager.instance
    private let folderName = "icon_images"
    
    init(urlString: String, name: String) {
        self.iconURLString = urlString
        self.iconName = name
        getIconImage()
    }
    
    private func getIconImage() {
        if let savedImage = fileManager.image(for: iconName, folderName: folderName) {
            image = savedImage
        } else {
            downloadIconImage()
        }
    }
    
    private func downloadIconImage() {
        guard let url = URL(string: iconURLString) else {
            return
        }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] image in
                guard let self = self, let image = image else { return }
                self.image = image
                self.imageSubscription?.cancel()
                self.fileManager.save(image: image, imageName: self.iconName, folderName: self.folderName)
            })
    }
}
