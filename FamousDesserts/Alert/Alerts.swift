//
//  Alerts.swift
//  FamousDesserts
//
//  Created by Mine Rala on 1.09.2021.
//

import Foundation
import UIKit

class Alerts: NSObject {
    
    private let addDessertVC = AddDessertViewController()

    static func showAlertDelete(controller: UIViewController, _ message: String, deletion: @escaping () -> Void) {
         let dialogMessage = UIAlertController(title: "Deletion Confirmation", message: message, preferredStyle: .alert)
         let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: { (action) in
         deletion()
         })
        deleteAction.setValue(UIColor.red, forKey: "titleTextColor")
         dialogMessage.addAction(deleteAction)

         dialogMessage.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: { (action) in
            print("cancel is tapped.")
         }))
         controller.present(dialogMessage, animated: true, completion: {})
    }
    
    static func showAlertImagePicker(controller: UIViewController, message: String, openCameraButtonClicked: @escaping () -> Void, openLibraryButtonClicked: @escaping () -> Void) {
        let dialogMessage = UIAlertController(title: "Select Image", message: message, preferredStyle: .alert)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
          openCameraButtonClicked()       
        }
        let libraryAction = UIAlertAction(title: "Library", style: .default) { (_) in
           openLibraryButtonClicked()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        dialogMessage.addAction(cameraAction)
        dialogMessage.addAction(libraryAction)
        dialogMessage.addAction(cancelAction)
        controller.present(dialogMessage, animated: true, completion: nil)
    }
    
    static func showAlertMissingText(controller: UIViewController, message: String, completion: @escaping () -> Void) {
        let dialogMessage = UIAlertController(title: "Misssing Argument", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okey", style: .default) { (_) in }
        dialogMessage.addAction(okAction)
        controller.present(dialogMessage, animated: true, completion: nil)
    }
    
}
