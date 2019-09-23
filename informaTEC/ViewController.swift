//
//  ViewController.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/3/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import UIKit
import Lottie

extension UITextField{
    func setIcon(_ image: UIImage){
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

class ViewController: UIViewController {
    let manager = CoreDataManager()


    @IBOutlet weak var txtControl: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var viewL: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtControl.setIcon(UIImage(named: "icons8-usuario-50")!)
        txtPassword.setIcon(UIImage(named: "pass")!)
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print("INSERTANDO REGISTRO")
        manager.createAvisos(id: 11, userId: 9, titulo: "Aviso 1", descripcion: "ESTE ES UN AVISO", estado: 1, fechaAlta: Date(), fechaFin: Date(), completion: {
            print("Registro insertado x2")
        })
    }
    
    @IBAction func btnLogin(_ sender: Any) {
       self.performSegue(withIdentifier: "segueHome", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    

}

