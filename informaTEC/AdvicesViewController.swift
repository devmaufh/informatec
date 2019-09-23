//
//  AdvicesViewController.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/11/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import UIKit

class AdvicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "avisoCelda")
        cell.textLabel?.text  = avisos[indexPath.row]
        cell.textLabel?.textColor = UIColor.red
        cell.detailTextLabel?.text = "Este es el detalle de la celda, la neta no se que pex con esto jsjsjs"
        cell.imageView!.image = UIImage(named: "educafin")!
        
        
        return cell
    }
    
    var avisos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let aviso = "Este es mi primer aviso"
        avisos = [aviso,aviso,aviso,aviso,aviso,aviso,aviso]
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return avisos.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    

    


}
