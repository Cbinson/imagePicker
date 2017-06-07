//
//  ViewController.swift
//  imagePicker
//
//  Created by binsonchang on 2017/6/7.
//  Copyright © 2017年 tw.com.binson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

extension ViewController {

    var alertControl:UIAlertController {
        let controller = UIAlertController.init(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        controller.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
        controller.addAction(UIAlertAction.init(title: "相機", style: .default, handler: { (action) in
            self.selectedSourceType(.camera)
        }))
        controller.addAction(UIAlertAction.init(title: "相簿", style: .default, handler: { (action) in
            self.selectedSourceType(.photoLibrary)
        }))

        return controller
    }


    @IBAction func onTapImageView(_ sender: UITapGestureRecognizer) {
        present(alertControl, animated: true, completion: nil)
    }

    func selectedSourceType(_ type:UIImagePickerControllerSourceType) {
        imagePickerController.sourceType = type

        present(imagePickerController, animated: true, completion: nil)
    }
}


extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var imagePickerController: UIImagePickerController {
        get{
            let imagePicket = UIImagePickerController()
            imagePicket.delegate = self
            imagePicket.sourceType = .photoLibrary
            return imagePicket
        }
    }


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        dismiss(animated: true, completion: nil)

        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = .scaleToFill
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
