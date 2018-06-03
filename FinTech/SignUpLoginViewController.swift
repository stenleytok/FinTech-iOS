//
//  SignUpLoginViewController.swift
//  FinTech
//
//  Created by Stenley Tok on 1/6/18.
//  Copyright © 2018 Stenley Tok. All rights reserved.
//
import UIKit


class SignUpLoginViewController: UIViewController {
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var VersionLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .white;
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setButtonStyle(button: LoginButton, backgroundColor: UIColor.black, borderColor: UIColor.clear)
        setButtonStyle(button: SignUpButton, backgroundColor: UIColor.clear, borderColor: UIColor.black, hasBorder:true)
        
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
        VersionLabel.text = version as! String
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        PasswordTextField.setBottomBorder()
        EmailTextField.setBottomBorder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButtonStyle(button:UIButton, backgroundColor: UIColor, borderColor: UIColor, hasBorder:Bool? = false ){
        button.layer.cornerRadius = button.frame.size.height / 2
        button.backgroundColor = backgroundColor;
        button.layer.borderColor = borderColor.cgColor
        if(hasBorder!){
            button.layer.borderWidth = 1
        }
    }
    
    
    
    // MARK: - Action
    
    @IBAction func OnLoginClicked(_ sender: Any) {
        var sError = ""
        if (EmailTextField.text?.isEmpty)!{
            sError = getString(text: "Login_EmailRequired")
            showPopUp(view:self, title: "Login", message:sError)
            return
        }
        if(PasswordTextField.text?.isEmpty)!{
            sError = getString(text:"Login_PasswordRequired")
            showPopUp(view: self, title: "Login", message: sError)
            return
        }
        
        
        
        
    }
    
    @IBAction func OnSignUpClicked(_ sender: Any) {
        var sError = ""
        if (EmailTextField.text?.isEmpty)!{
            sError = getString(text: "SignUp_EmailRequired")
            showPopUp(view:self, title: "Sign Up", message:sError)
            return
        }
        if(PasswordTextField.text?.isEmpty)!{
            sError = getString(text:"SignUp_PasswordRequired")
            showPopUp(view: self, title: "Sign Up", message: sError)
            return
        }
        
        //let signUpSegue = UIStoryboardSegue.init(identifier: <#T##String?#>, source: <#T##UIViewController#>, destination: <#T##UIViewController#>)
        let signUpForm = SignUpForm.init(email: EmailTextField.text!, password: PasswordTextField.text!)
        performSegue(withIdentifier: "signUpSegue", sender: signUpForm)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
