//
//  LoginViewController.swift
//  UserDefaults
//
//  Created by Josue J Maqueda Flores on 3/9/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //
        boxView.layer.borderWidth = 1
        boxView.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginAction(_ sender: UIButton)
    {
        self.validateUser()
    }
    
    
    private func validateUser()
    {
        if let user = UserDefaults.standard.string(forKey: "user"), let psw = UserDefaults.standard.string(forKey: "password")
        {
            guard let usr_f = userField.text, let pws_f = passField.text, !usr_f.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty, !pws_f.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty else
            {
                customAlert(mensaje: "Validar campos requeridos")
                return
            }
            
            //Validar datos registrados
            if user == usr_f
            {
                if psw == pws_f
                {
                    self.performSegue(withIdentifier: "successId", sender: nil)
                }
                else
                {
                    customAlert(mensaje: "Contraseña incorrecta !!")
                }
            }
            else
            {
                customAlert(mensaje: "Usuario incorrecto")
            }
        }
    }
    
    private func customAlert(mensaje:String)
    {
        let alerta = UIAlertController(title: "Error", message: mensaje, preferredStyle: .alert)
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
