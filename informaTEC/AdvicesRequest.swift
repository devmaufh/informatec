//
//  AdvicesRequest.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/26/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import Foundation


class ApiRepository{
    private init(){}
    static let shared = ApiRepository()
    
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "URL to get data")
    
    func getAdvices(completion: @escaping(_ adivesDict: [[String: Any]]?, _ error: Error?) -> ()){
        let advicesURL = baseURL?.appendingPathComponent("avisos")
        URLSession.dataTask(with: advicesURL
    }
}
