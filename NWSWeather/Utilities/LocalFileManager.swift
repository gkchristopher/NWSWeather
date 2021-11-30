//
//  LocalFileManager.swift
//  SwiftfulCrypto
//
//  Created by Christopher Moore on 11/16/21.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init() {}
    
    func save(image: UIImage, imageName: String, folderName: String) {
        
        createFolderIfNeeded(folderName: folderName)
        
        guard let data = image.pngData(),
        let url = urlForImage(imageName: imageName, folderName: folderName) else
        {
            return
        }
        
        do {
            try data.write(to: url)
        } catch {
            print("Error saving image for \(imageName). \(error.localizedDescription)")
        }
    }
    
    func image(for name: String, folderName: String) -> UIImage? {
        guard let url = urlForImage(imageName: name, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
                  return nil
              }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func urlForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return url.appendingPathComponent(folderName)
    }
    
    private func urlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = urlForFolder(folderName: folderName) else {
            return nil
        }
        
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = urlForFolder(folderName: folderName) else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating directory at \(folderName). \(error.localizedDescription)")
            }
        }
    }
}
