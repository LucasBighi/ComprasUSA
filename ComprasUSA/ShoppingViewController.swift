//
//  ShoppingViewController.swift
//  ComprasUSA
//
//  Created by Lucas Marques Bighi on 07/12/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField! {didSet { tfDolar?.addDoneCancelToolbar(onDone: (target: self, action: #selector(done))) }}
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setAmount()
        view.endEditing(true)
    }
    
    @objc func done() {
        setAmount()
        tfDolar.resignFirstResponder()
    }
    
    func setAmount() {
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        lbRealDescription.text = "Valor sem impostos (dólar \(dolar))"
    }
}
