//
//  ManageUserDefault.swift
//  ejerc1DiTema2
//
//  Created by Montacer El Fazazi on 21/12/2023.
//

import UIKit

class ManageUserDefault: NSObject {
    func guardar(texto: String, clave: String){
        UserDefaults.standard.set(texto, forKey: clave)
        UserDefaults.standard.synchronize()
    }
    
    func recuperar(clave: String) -> String{
        guard let devolver: String =
                (UserDefaults.standard.value(forKey: clave)) as? String
        else{
            return ""
        }
        
        return devolver
        
    }
    
    func borrar(clave: String){
        UserDefaults.standard.removeObject(forKey: clave)
        UserDefaults.standard.synchronize()
    }
}
