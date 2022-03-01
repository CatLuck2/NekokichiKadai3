//
//  ViewController.swift
//  NekokichiKadai3
//
//  Created by Nekokichi on 2022/02/28.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak private var num1Label: UILabel!
    @IBOutlet weak private var num2Label: UILabel!
    @IBOutlet weak private var calculatedResultLabel: UILabel!

    private var calculateAdditionModel: CalculateAdditionModel = CalculateAdditionModel()
    
    @IBAction func inputNum1(_ sender: UITextField) {
        calculateAdditionModel.setNum1(Int(sender.text ?? "") ?? 0)
    }
    
    @IBAction func inputNum2(_ sender: UITextField) {
        calculateAdditionModel.setNum2(Int(sender.text ?? "") ?? 0)
    }
    
    @IBAction func toggleSignOfNum1(_ sender: UISwitch) {
        // 符号を反転
        if case sender.isOn = true {
            calculateAdditionModel.setNum1(-abs(calculateAdditionModel.num1))
        } else {
            calculateAdditionModel.setNum1(abs(calculateAdditionModel.num1))
        }
    }
    
    @IBAction func toggleSignOfNum2(_ sender: UISwitch) {
        // 符号を反転
        if case sender.isOn = true {
            calculateAdditionModel.setNum2(-abs(calculateAdditionModel.num2))
        } else {
            calculateAdditionModel.setNum2(abs(calculateAdditionModel.num2))
        }
    }
    
    @IBAction func calculateAddition(_ sender: UIButton) {
        num1Label.text = "\(calculateAdditionModel.num1)"
        num2Label.text = "\(calculateAdditionModel.num2)"
        calculatedResultLabel.text = "\(calculateAdditionModel.result())"
    }
}

