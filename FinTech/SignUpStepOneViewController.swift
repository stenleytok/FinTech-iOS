//
//  SignUpStepOneViewController.swift
//  FinTech
//
//  Created by Stenley Tok on 1/6/18.
//  Copyright © 2018 Stenley Tok. All rights reserved.
//

import UIKit
import CTKFlagPhoneNumber

class SignUpStepOneViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var GenderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var DoBTextField: UITextField!
    @IBOutlet weak var PhoneNumTextField: CTKFlagPhoneNumberTextField!
    @IBOutlet weak var NRICTextField: UITextField!
    var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickUpDate(DoBTextField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Make a view with date picker and done button
    func pickUpDate(_ textField : UITextField){
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        textField.inputView = self.datePicker
        datePicker.addTarget(self, action: #selector(SignUpStepOneViewController.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SignUpStepOneViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(SignUpStepOneViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        DoBTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        DoBTextField.text = dateFormatter1.string(from: datePicker.date)
        DoBTextField.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        DoBTextField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(DoBTextField)
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
