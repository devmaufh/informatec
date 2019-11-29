//
//  AdvicesViewController.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/11/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import UIKit


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class AdvicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let manager = CoreDataManager()
    

    
    var avisos: [AvisoEntity] = []
    var position: Int = 0

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "avisoCelda")
        cell.textLabel?.text  = avisos[indexPath.row].titulo
        //cell.textLabel?.textColor = UIColor.red
        cell.detailTextLabel?.text = avisos[indexPath.row].descripcion

        print("http://informatec.azurewebsites.net/images/\(String(describing: avisos[indexPath.row].image))")
        let url: String!
        url = "http://informatec.azurewebsites.net/images/\(avisos[indexPath.row].image ?? "")"
        cell.imageView!.load(url: URL(string: url)!)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        avisos = manager.retrieveAvisos()
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return avisos.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        position = indexPath.row
        performSegue(withIdentifier: "aviso_detalle", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aviso_detalle"{
            let segueDetaile = segue.destination as! DetalleAvisoViewController
            segueDetaile.aviso = avisos[position]
        }
    }
    
}
