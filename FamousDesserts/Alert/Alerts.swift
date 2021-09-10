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
        let dialogMessage = UIAlertController(title: NSLocalizedString(C.Text.deletionConfirmation.rawValue, comment: ""), message: message, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: NSLocalizedString(C.Text.delete.rawValue, comment: ""), style: .default, handler: { (action) in
         deletion()
         })
        deleteAction.setValue(C.Color.redColor, forKey: "titleTextColor")
         dialogMessage.addAction(deleteAction)

        dialogMessage.addAction(UIAlertAction(title:NSLocalizedString(C.Text.cancel.rawValue, comment: ""), style: .cancel, handler: { (action) in
            print("cancel is tapped.")
         }))
         controller.present(dialogMessage, animated: true, completion: {})
    }
    
    static func showAlertImagePicker(controller: UIViewController, message: String, openCameraButtonClicked: @escaping () -> Void, openLibraryButtonClicked: @escaping () -> Void) {
        let dialogMessage = UIAlertController(title: NSLocalizedString(C.Text.selectPhoto.rawValue, comment: ""), message: message, preferredStyle: .alert)
        let cameraAction = UIAlertAction(title: NSLocalizedString(C.Text.camera.rawValue, comment: ""), style: .default) { (_) in
          openCameraButtonClicked()       
        }
        let libraryAction = UIAlertAction(title: NSLocalizedString(C.Text.library.rawValue, comment: ""), style: .default) { (_) in
           openLibraryButtonClicked()
        }
        let cancelAction = UIAlertAction(title: NSLocalizedString(C.Text.cancel.rawValue, comment: ""), style: .cancel, handler: nil)
        dialogMessage.addAction(cameraAction)
        dialogMessage.addAction(libraryAction)
        dialogMessage.addAction(cancelAction)
        controller.present(dialogMessage, animated: true, completion: nil)
    }
    
    static func showAlertMissingText(controller: UIViewController, message: String, completion: @escaping () -> Void) {
        let dialogMessage = UIAlertController(title: NSLocalizedString(C.Text.missingArgument.rawValue, comment: ""), message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString(C.Text.okey.rawValue, comment: ""), style: .default) { (_) in }
        dialogMessage.addAction(okAction)
        controller.present(dialogMessage, animated: true, completion: nil)
    }
    
}
