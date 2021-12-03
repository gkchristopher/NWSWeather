//
//  IconImageViewModel.swift
//
//  Created by Christopher Moore on 11/13/21.
//

import Foundation
import SwiftUI
import Combine

class IconImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let urlString: String
    private let iconName: String
    private let dataService: IconImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(urlString: String, iconName: String) {
        self.urlString = urlString
        self.iconName = iconName
        self.dataService = IconImageService(urlString: urlString, name: iconName)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
    }
}
