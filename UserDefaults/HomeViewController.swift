//
//  HomeViewController.swift
//  UserDefaults
//
//  Created by Josue J Maqueda Flores on 3/9/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        self.initSetup()
    }
    
    private func initSetup()
    {
        if let user = UserDefaults.standard.string(forKey: "user"), let psw = UserDefaults.standard.string(forKey: "password"), let name = UserDefaults.standard.string(forKey: "name")
        {
            self.userField.text = user
            self.nameField.text = name
            self.passField.text = psw
        }
    }
    
    @IBAction func updateAction(_ sender: UIButton)
    {
        self.updateData()
    }
    
    private func updateData()
    {
         if let usr_f = userField.text, let pws_f = passField.text, let name = nameField.text, !usr_f.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty, !pws_f.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty, !name.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
         {
            UserDefaults.standard.set(usr_f, forKey: "user")
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(pws_f, forKey: "password")
            //
            customAlert(mensaje: "Datos actualizados correctamente")
        }
        else
         {
            customAlert(mensaje: "LLenar campos requeridos")
        }
    }
    
    private func customAlert(mensaje:String)
    {
        let alerta = UIAlertController(title: "Mensaje", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alerta.addAction(action)
        self.present(alerta, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
