//
//  Structures.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 10/10/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import Foundation


public struct Aviso: Codable {
    let usrId: Int
    let idAviso: Int
    let titulo: String
    let descripcion: String
    let fechaFin: Date
    let fechaAlta: Date
    let estado: Int
    let url: String
}

