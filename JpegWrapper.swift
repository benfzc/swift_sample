//
//  JpegWrapper.swift
//  QRCodeReader
//
//  Created by ben on 2018/6/27.
//  Copyright © 2018年 AppCoda. All rights reserved.
//

import Foundation
import UIKit

class JpegWrapper {
    static let subdirectoryName = "image"
    
    static func getPathOfsubdirectoryInDocumentDirectory(_ directoryName: String, createIfNotExist: Bool) -> URL? {
        let fileManager = FileManager.default
        
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let subdirectoryPath = documentDirectory.appendingPathComponent(directoryName, isDirectory: true)
        if !fileManager.fileExists(atPath: subdirectoryPath.path) {
            if createIfNotExist {
                do {
                    try fileManager.createDirectory(atPath: subdirectoryPath.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    return nil
                }
            }
            else {
                return nil
            }
        }
        
        return subdirectoryPath
    }
    
    static func saveImageAsJpegFile(_ image: UIImage?) -> String? {
        guard let image = image, let jpegData = UIImageJPEGRepresentation(image, 0.9) else {
            return nil
        }
        
        // save to app directory
        guard let imageDirecotry = getPathOfsubdirectoryInDocumentDirectory(subdirectoryName, createIfNotExist: true) else {
            return nil
        }
        
        // generate unique image filename
        let uuid = NSUUID().uuidString
        let fileName = "\(uuid).jpg"
        let filePath = imageDirecotry.appendingPathComponent(fileName)
        
        // default overwrite existing file
        do {
            try jpegData.write(to: filePath)
        } catch {
            return nil
        }
        
        return fileName
    }
    
    static func loadJpegFromDocumentDirectory(filename: String) -> UIImage? {
        guard let imageDirecotry = getPathOfsubdirectoryInDocumentDirectory(subdirectoryName, createIfNotExist: true) else {
            return nil
        }
        
        let path = imageDirecotry.appendingPathComponent(filename)
        print("read image from : \(path)")
        return UIImage(contentsOfFile: path.path)
    }
}
