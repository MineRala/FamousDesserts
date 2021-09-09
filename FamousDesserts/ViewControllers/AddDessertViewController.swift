//
//  AddDessertViewController.swift
//  FamousDesserts
//
//  Created by Mine Rala on 31.08.2021.
//

import Foundation
import UIKit

class AddDessertViewController: UIViewController ,UITextViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
 
    var delegate: AddNewDessertDelegate!
    var addDessertViewModel = AddDessertViewModel()
    
    private let imagePickerController = UIImagePickerController()
    
    lazy var dessertImage : UIImageView = {
        let dı = UIImageView(frame: .zero)
        dı.translatesAutoresizingMaskIntoConstraints = false
        dı.layer.cornerRadius = 16
        dı.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dessertImageTapped))
        dı.addGestureRecognizer(tap)
        dı.isUserInteractionEnabled = true
        return dı
    }()
    
    lazy var dessertName: UITextField = {
        let dn = UITextField(frame: .zero)
        dn.placeholder = "Dessert Name"
        dn.autocorrectionType = .no
        dn.autocapitalizationType = .sentences
        dn.translatesAutoresizingMaskIntoConstraints = false
        return dn
    }()
    
    lazy var dessertCountry: UITextField = {
        let dc = UITextField(frame: .zero)
        dc.placeholder = "Dessert Country"
        dc.autocorrectionType = .no
        dc.autocapitalizationType = .sentences
        dc.translatesAutoresizingMaskIntoConstraints = false
        return dc
    }()
    
    lazy var dessertDescription: UITextView = {
        let dd = UITextView(frame: .zero)
        dd.isScrollEnabled = true
        dd.isEditable = true
        dd.autocorrectionType = .no
        dd.autocapitalizationType = .sentences
        dd.font = UIFont(name:"Helvetica Neue Light", size: 24)
        dd.translatesAutoresizingMaskIntoConstraints = false
        return dd
    }()
    
    lazy var dessertStar: UIButton = {
        let ds = UIButton(frame: .zero)
        ds.tintColor = .orange
        ds.translatesAutoresizingMaskIntoConstraints = false
        return ds
    }()
    
    lazy var dessertInfo: UIStackView = {
        let dı = UIStackView(frame: .zero)
        dı.axis = .horizontal
        dı.alignment = .fill
        dı.distribution = .equalSpacing
        dı.spacing = 24
        return dı
    }()
    
    lazy var placeholdertText: UILabel = {
        let pt = UILabel(frame: .zero)
        pt.text = "Selecet Photo"
        pt.textColor = .black
        pt.font = UIFont(name:"Helvetica Neue Light", size: 16)
        pt.isUserInteractionEnabled = false
        return pt
    }()
    
    lazy var addButton: UIButton = {
        let ab = UIButton(frame: .zero)
        ab.setTitle("Add", for: .normal)
        ab.setTitleColor(.black, for: .normal)
        ab.layer.cornerRadius = 16
        ab.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        ab.titleLabel?.font = UIFont(name:"Helvetica Neue Light", size: 16)
        ab.translatesAutoresizingMaskIntoConstraints = false
        return ab
    }()
    
    lazy var removeImageButton: UIButton = {
        let rb = UIButton(frame: .zero)
        rb.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
        rb.tintColor = UIColor.black
        rb.backgroundColor = UIColor.systemGray5
        rb.isHidden = true
        rb.translatesAutoresizingMaskIntoConstraints = false
        return rb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()

        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        self.view.addGestureRecognizer(tap)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        removeImageButton.layer.cornerRadius = removeImageButton.frame.height/2
        removeImageButton.layer.opacity = 0.5
    }
    
    private func setUpUI() {
        super.view.backgroundColor = .white
   
        self.view.addSubview(dessertImage)
        dessertImage.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        dessertImage.topAnchor(margin: 0)
            .trailingAnchor(margin: 16)
            .heightAnchor(180)
        
        dessertImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        
        self.dessertImage.addSubview(placeholdertText)
        placeholdertText.centerXAnchor(margin: 0).centerYAnchor(margin: 0)
        
        self.dessertImage.addSubview(removeImageButton)
        removeImageButton.trailingAnchor(margin: 8).topAnchor(margin: 8).heightAnchor(32).widthAnchor(32)
        
        self.view.addSubview(dessertInfo)
        dessertInfo.addArrangedSubview(dessertName)
        dessertInfo.addArrangedSubview(dessertCountry)
        dessertInfo.addArrangedSubview(dessertStar)
        self.view.addSubview(dessertDescription)
        
        
        dessertInfo.topAnchor.constraint(equalTo: dessertImage.bottomAnchor, constant: 8).isActive = true
        dessertInfo.leadingAnchor(margin: 28).trailingAnchor(margin: 28).heightAnchor(64)
        
        dessertDescription
            .leadingAnchor(margin: 16)
            .trailingAnchor(margin: 16)
        dessertDescription.topAnchor.constraint(equalTo: dessertInfo.bottomAnchor, constant: 0).isActive = true
    
        self.view.addSubview(addButton)
        addButton.leadingAnchor(margin: 16)
            .trailingAnchor(margin: 16)
            .bottomAnchor(margin: 32)
            .heightAnchor(48)
        
        dessertDescription.bottomAnchor.constraint(equalTo: self.addButton.topAnchor, constant: -8).isActive = true
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        removeImageButton.addTarget(self, action: #selector(removeImageButtonTapped), for: .touchUpInside)
        
        //Sayfa açılırken textlere yapıştırıyor. Descriptionda placeholder kullanırsan descriptionu yapıştırmıyor.
        if addDessertViewModel.dessertState == .update {
            self.placeholdertText.isHidden = true
            
            if addDessertViewModel.dessert.imageData == nil{
                dessertImage.image = UIImage(named: addDessertViewModel.dessert.image)
            }else{
                dessertImage.image = UIImage(data: addDessertViewModel.dessert.imageData!)
            }
            
            dessertName.text = addDessertViewModel.dessert.name
            dessertCountry.text = addDessertViewModel.dessert.country
            dessertDescription.text = addDessertViewModel.dessert.description
            addButton.setTitle("Update", for: .normal)
        }
        // dessertState == .add olduğunda descriptionda placeholder görmek için yapıldı.
        else {
            dessertDescription.text = "Description"
            dessertDescription.delegate = self
            dessertDescription.textColor = UIColor.lightGray
        }
        
        if addDessertViewModel.dessert.isFavorite == true{
            dessertStar.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else{
            dessertStar.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        dessertStar.addTarget(self, action: #selector(dessertStarTapped), for: .touchUpInside)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Description"
            textView.textColor = UIColor.lightGray
            }
    }
    
    @objc func dessertImageTapped() {
        Alerts.showAlertImagePicker(controller: self, message: "Select Image From",
        openCameraButtonClicked: { 
            self.showImagePicker(selectedSource: .camera)
            self.placeholdertText.isHidden = true
            self.removeImageButton.isHidden = false
        }, openLibraryButtonClicked: {
            self.showImagePicker(selectedSource: .photoLibrary)
            self.placeholdertText.isHidden = true
            self.removeImageButton.isHidden = false
        })
    }
    
    @objc func addButtonTapped() {
        if dessertDescription.text == "Description" || dessertDescription.text == "" {
            Alerts.showAlertMissingText(controller: self, message: inValidatedFieldsMessage()) {}
            return
        }
        guard validateDesserts() == true else {
            Alerts.showAlertMissingText(controller: self, message: inValidatedFieldsMessage()) {}
            return
        }
        saveNewDessert()
        self.navigationController?.popViewController(animated: true)
    }
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("Selected source not available")
            return
        }
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image Not Found!")
            return
        }
        let oriantedImage = selectedImage.fixedOrientation()
        dessertImage.image = oriantedImage
        addDessertViewModel.dataOfSelectedImage = oriantedImage.pngData()
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func removeImageButtonTapped(){
        dessertImage.image = nil
        placeholdertText.isHidden = false
        removeImageButton.isHidden = true
    }

    @objc func endEditing() {
        self.dessertDescription.endEditing(true)
        self.dessertName.endEditing(true)
        self.dessertCountry.endEditing(true)
    }
    
    private func saveNewDessert() {
        if addDessertViewModel.dessertState == .add {
            addDessertViewModel.dessert = Dessert()
            addDessertViewModel.dessert.id = UUID().uuidString
            addDessertViewModel.dessert.imageData = addDessertViewModel.dataOfSelectedImage
            addDessertViewModel.dessert.name = dessertName.text!
            addDessertViewModel.dessert.country = dessertCountry.text!
            addDessertViewModel.dessert.description = dessertDescription.text!
            addDessertViewModel.dessert.isFavorite = addDessertViewModel.stateFavori
            self.delegate.passDessert(dessert: addDessertViewModel.dessert)
            self.dismiss(animated: true, completion: nil)
        }else {
            if addDessertViewModel.dataOfSelectedImage != nil {
                addDessertViewModel.dessert.imageData = addDessertViewModel.dataOfSelectedImage
                addDessertViewModel.dessert.image = ""
            }
            addDessertViewModel.dessert.name = dessertName.text!
            addDessertViewModel.dessert.country = dessertCountry.text!
            addDessertViewModel.dessert.description = dessertDescription.text!
            addDessertViewModel.dessert.isFavorite = addDessertViewModel.stateFavori
            self.delegate.passDessert(dessert: addDessertViewModel.dessert)
           
            self.dismiss(animated: true, completion: nil)
        }
    }

    private func validateDesserts () -> Bool {
        if dessertName.text?.count == 0 {
            return false
        }
        else if dessertCountry.text?.count == 0{
            return false
        }
        else if dessertDescription.text?.count == 0{
            return false
        }
        else if dessertImage.image == nil {
            return false
        }
        return true
    }

    private func inValidatedFieldsMessage() -> String {
        var str = ""
        if dessertImage.image == nil {
            str += "You must choose photo."
        }
        if dessertName.text?.count == 0 {
            str += "You must enter dessert name."
        }
        if dessertCountry.text?.count == 0 {
            str += "You must enter dessert country."
        }
        if dessertDescription.text == "Description" || dessertDescription.text == ""{
            str += "You must enter dessert description."
        }
        return str
    }
    
    @objc func dessertStarTapped() {
        if addDessertViewModel.dessert.isFavorite == false{
            addDessertViewModel.stateFavori = true
            dessertStar.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else{
            addDessertViewModel.stateFavori = false
            dessertStar.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    
}

extension UIImage {
    func fixedOrientation() -> UIImage {

        if imageOrientation == .up {
            return self
        }

        var transform: CGAffineTransform = CGAffineTransform.identity

        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat.pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat.pi / 2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: CGFloat.pi / -2)
        case .up, .upMirrored:
            break
        }

        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform.translatedBy(x: size.width, y: 0)
            transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform.translatedBy(x: size.height, y: 0)
            transform.scaledBy(x: -1, y: 1)
        case .up, .down, .left, .right:
            break
        }

        if let cgImage = self.cgImage, let colorSpace = cgImage.colorSpace,
            let ctx: CGContext = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) {
            ctx.concatenate(transform)

            switch imageOrientation {
            case .left, .leftMirrored, .right, .rightMirrored:
                ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
            default:
                ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            }
            if let ctxImage: CGImage = ctx.makeImage() {
                return UIImage(cgImage: ctxImage)
            } else {
                return self
            }
        } else {
            return self
        }
    }
}
