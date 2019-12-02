//
//  AdvicesRequest.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/26/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiRepository {
    static let shared = ApiRepository()
    init() {}
    let manager = CoreDataManager()
    func fetchAvisos(){
        Alamofire.request("http://informatec.azurewebsites.net/avisos")
            .responseJSON{ response in
                guard response.result.isSuccess,
                    let values = response.result.value else{
                        print("Error fetching data")
                        return
                }
                _ = JSON(values)["avisos"].array?.map{ json in
                    let id: Int16 = json["idAviso"].int16Value
                    let usrId: Int16 = json["usrId"].int16Value
                    let titulo: String = json["titulo"].stringValue
                    let descripcion: String = json["descripcion"].stringValue
                    let estado: Int16 = json["estado"].int16Value
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX")

                    
                    let fecha: Date =  dateFormatter.date(from:json["fechaAlta"].rawValue as! String)!

                    let fechaFin: Date = dateFormatter.date(from:json["fechaFin"].rawValue as! String)!
                    let img: String = json["img"].stringValue
                    
                    self.manager.createAvisos(id: id, userId: usrId, titulo: titulo, descripcion: descripcion, estado: estado, fechaAlta: fecha, fechaFin: fechaFin,image: img, completion: {
                        print("Aviso insertado")
                    })
                }
        }
    }
    func login(usr: String, pass:String, correo: String, telefono:String){
       let parameters: [String: Any] = [
            "usrId" : usr,
            "pwd" : pass,
            "noTel": telefono,
            "correo": correo

        ]
        Alamofire.request("http://informatec.azurewebsites.net/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("RESPONSE REQUEST LOGIN")
                print(response)
            }
    }
}
