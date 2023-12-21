//
//  MainViewController.swift
//  ejerc1DiTema2
//
//  Created by Montacer El Fazazi on 21/12/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var lbBienvenido: UILabel!
    
    var datos: ManageUserDefault!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    datos = ManageUserDefault()
        let usuario = datos.recuperar(clave: "USER")
        lbBienvenido.text = "Bienvenido \(usuario)"

    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        datos.borrar(clave: "USER")
        datos.borrar(clave: "PASSWORD")
        self.navigationController?.popViewController(animated: true) //pop es para quitar la actividad q hemos puesto antes con el push en el viewcontroller
    }
    

    
}
