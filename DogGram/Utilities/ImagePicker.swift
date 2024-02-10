//
//  ImagePicker.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Binding var imageSelected: UIImage?
    @Binding var sourceType: UIImagePickerController.SourceType

    @Environment(\.dismiss) var dismiss
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) { }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(parent: self)
    }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                // select the image for app
                parent.imageSelected = image
                // dismiis the screen
                parent.dismiss()
            }
        }
        
    }
}

