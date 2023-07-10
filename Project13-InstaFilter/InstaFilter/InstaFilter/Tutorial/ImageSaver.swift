//
//  ImageSaver.swift
//  InstaFilter
//
//  Created by Mostafa Hosseini on 7/8/23.
//

import UIKit

class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(
            image,
            // points to the class that contains the method
            self,
            // points to actual method name
            // Mark the method using a special compiler directive called #selector, which asks Swift to make sure the method name exists where we say it does.
            #selector(saveCompleted),
            // we can provide any sort of data here, and it will be passed back to us when our completion method is called.
            nil
        )
    }
    
    // objc: code that can be read by objective c
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
