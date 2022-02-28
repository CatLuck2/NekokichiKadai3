//
//  ViewController.swift
//  NekokichiKadai3
//
//  Created by Nekokichi on 2022/02/28.
//
/*
 エラー処理
 ・数値を入力したか
 ・数値の型は正しいか
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNum1: UITextField!
    @IBOutlet weak var inputNum2: UITextField!
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var calculatedResultLabel: UILabel!

    private var calculateAdditionModel: CalculateAdditionModel = CalculateAdditionModel()
    
    @IBAction func inputNum1(_ sender: UITextField) {
        calculateAdditionModel.num1 = Int(sender.text ?? "") ?? 0
    }
    
    @IBAction func inputNum2(_ sender: UITextField) {
        calculateAdditionModel.num2 = Int(sender.text ?? "") ?? 0
    }
    
    @IBAction func toggleSignOfNum1(_ sender: UISwitch) {
        // 符号を反転
        if case sender.isOn = true {
            calculateAdditionModel.num1 = -abs(calculateAdditionModel.num1)
        } else {
            calculateAdditionModel.num1 = abs(calculateAdditionModel.num1)
        }
    }
    
    @IBAction func toggleSignOfNum2(_ sender: UISwitch) {
        // 符号を反転
        if case sender.isOn = true {
            calculateAdditionModel.num2 = -abs(calculateAdditionModel.num2)
        } else {
            calculateAdditionModel.num2 = abs(calculateAdditionModel.num2)
        }
    }
    
    @IBAction func calculateAddition(_ sender: UIButton) {
        num1Label.text = "\(calculateAdditionModel.num1)"
        num2Label.text = "\(calculateAdditionModel.num2)"
        calculatedResultLabel.text = "\(calculateAdditionModel.result())"
    }
}

