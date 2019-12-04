//
//  CredentialViewController.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/11/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import UIKit

class CredentialViewController: UIViewController {
    

    @IBOutlet weak var lblnombre: UILabel!
    @IBOutlet weak var credencialView: UIView!
    
    @IBOutlet weak var lblid: UILabel!
    @IBOutlet weak var qrImage: UIImageView!
    override func viewDidLoad() {
        let nom = UserDefaults.standard.string(forKey: "nomUsr") ?? "Juan daniel torres moreno"
        let usrId = UserDefaults.standard.string(forKey: "usrId") ?? "rfc1"
        super.viewDidLoad()
        credencialView.layer.cornerRadius = 20.0
        credencialView.layer.shadowColor = UIColor.gray.cgColor
        credencialView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        credencialView.layer.shadowRadius = 12.0
        credencialView.layer.shadowOpacity = 0.7
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        qrImage.image = generateQRCode(from: usrId)
        self.tabBarController?.tabBar.isHidden = false
        
        lblnombre.text = nom
        lblid.text = usrId
        

    }
    var flag = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        flag = !flag
        self.tabBarController?.tabBar.isHidden = flag

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }

}
