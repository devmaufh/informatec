//
//  CoreDataManager.swift
//  informaTEC
//
//  Created by Labdesarrollo6 on 9/23/19.
//  Copyright © 2019 Roqbyte. All rights reserved.
//

import Foundation

import CoreData

class CoreDataManager{
    private let container: NSPersistentContainer!
    init() {
        container = NSPersistentContainer(name: "Aviso")
        setupDatabase()
    }
    private func setupDatabase() {
        container.loadPersistentStores(completionHandler: { (desc,errors) in
            if let error = errors
            {
                fatalError("BD error \(error)")
                return
            }
            
            
        })
    }
    func createAvisos(id: Int16, userId: Int16, titulo: String, descripcion: String, estado: Int16, fechaAlta: Date, fechaFin: Date,image: String, completion: @escaping() -> Void){
        let context = container.viewContext
        let aviso = AvisoEntity(context: context)
        aviso.id = id
        aviso.user_id = userId
        aviso.titulo = titulo
        aviso.descripcion = descripcion
        aviso.estado = estado
        aviso.fechaAlta = fechaAlta
        aviso.fechaFin = fechaFin
        aviso.image = image
        do {
            try context.save()
            print("Aviso guardado \(titulo)")
            completion()
        } catch{
            print("Error al guardar avisos")
        }
    }
    func deleteAll (){
        let context = container.viewContext
        print("Borrando avisos")

        let fetchAvisos = NSFetchRequest<NSFetchRequestResult>(entityName: "AvisoEntity")
        let batchRq = NSBatchDeleteRequest(fetchRequest: fetchAvisos )
        do{
            try context.execute(batchRq)
        } catch{
            print("ERROR AL BORRAr")
        }
    }
    func retrieveAvisos() -> [AvisoEntity]{
        var avisos: [AvisoEntity] = []
        let context = container.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "AvisoEntity")
        
        do{
            let result = try context.fetch(fetchRequest)
            
            for aviso in result as! [AvisoEntity] {
                avisos.append(aviso)
            }
        } catch {
            print("Error")
        }
        return avisos
    }
}
