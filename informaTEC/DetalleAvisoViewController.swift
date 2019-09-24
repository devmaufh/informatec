//
//  DetalleAvisoViewController.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/24/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import UIKit

class DetalleAvisoViewController: UIViewController {
    
    var aviso: AvisoEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().tintColor = UIColor.red
        UINavigationBar.appearance().backgroundColor = UIColor.blue
        lblTitulo.text = aviso.titulo
        lblDescripcion.text = aviso.descripcion
        
    }
    
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBAction func btn_back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
