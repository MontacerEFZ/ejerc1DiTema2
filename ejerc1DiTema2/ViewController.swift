//
//  ViewController.swift
//  ejerc1DiTema2
//
//  Created by Montacer El Fazazi on 21/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    
    var datos: ManageUserDefault!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datos = ManageUserDefault()
        let usuario = datos.recuperar(clave: "USER")
        let password = datos.recuperar(clave: "PASSWORD")
        
        if(!usuario.isEmpty && !password.isEmpty){
            let ventana =
                self.storyboard?.instantiateViewController(identifier: "MAIN") as! MainViewController
            self.navigationController?.pushViewController(ventana, animated: true) //push es para poner una actividad encima de otra
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MAIN" {
            datos.guardar(texto: txtUsuario.text!, clave: "USER")
            datos.guardar(texto: txtPassword.text!, clave: "PASSWORD")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let user = txtUsuario.text
        else{
            return false
        }
        
        guard let password = txtPassword.text
        else{
            return false
        }
        
        if user.count < 3 || password.count < 6
        {
            return false;
        }
        
        return true;
    }


}

