//
//  RegisterViewController.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/6/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import UIKit
import Lottie



class RegisterViewController: UIViewController {
    @IBOutlet weak var animationLotie: AnimationView!
    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().tintColor = UIColor.red
        UINavigationBar.appearance().backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
        tfName.setIcon(UIImage(named: "icons8-usuario-50")!)
        tfEmail.setIcon(UIImage(named: "icons8-email-50")!)
        tfPhone.setIcon(UIImage(named: "icons8-diez-llaves-50")!)
        tfPassword.setIcon(UIImage(named: "pass")!)
        tfConfirmPassword.setIcon(UIImage(named: "cpass")!)
    }
    
    @IBAction func btnRegistro(_ sender: UIButton) {
        let user: String! = tfName.text
        let pass:String! = tfPassword.text
        let mail :String! = tfEmail.text
        let telefono: String! = tfPhone.text
        var x = ApiRepository().login(usr: user, pass: pass, correo: mail, telefono: telefono)
        
        
    }
    
    
    //ApiRepository().login(usr: "rfc1", pass: "12345", correo: "nuevo@s.com", telefono: "prin")


   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     
     
     
    */
    

}
