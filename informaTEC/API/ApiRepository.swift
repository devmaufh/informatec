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
        Alamofire.request("http://172.16.253.132:5000/avisos")
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
                    
                    self.manager.createAvisos(id: id, userId: usrId, titulo: titulo, descripcion: descripcion, estado: estado, fechaAlta: fecha, fechaFin: fechaFin, completion: {
                        print("Aviso insertado")
                    })
                    
                }
                
        }
    }
}
