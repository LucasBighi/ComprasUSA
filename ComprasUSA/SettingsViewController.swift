//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Lucas Marques Bighi on 07/12/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField! {didSet { tfDolar?.addDoneCancelToolbar(onDone: (target: self, action: #selector(done))) }}
    @IBOutlet weak var tfIOF: UITextField! {didSet { tfIOF?.addDoneCancelToolbar(onDone: (target: self, action: #selector(done))) }}
    @IBOutlet weak var tfStateTaxes: UITextField! {didSet { tfStateTaxes?.addDoneCancelToolbar(onDone: (target: self, action: #selector(done))) }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDolar.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        tfStateTaxes.text = tc.getFormattedValue(of: tc.stateTax, withCurrency: "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    @objc func done() {
        setValues()
        view.endEditing(true)
    }
    
    func setValues() {
        tc.dolar = tc.convertToDouble(tfDolar.text!)
        tc.iof = tc.convertToDouble(tfIOF.text!)
        tc.stateTax = tc.convertToDouble(tfStateTaxes.text!)
        
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
