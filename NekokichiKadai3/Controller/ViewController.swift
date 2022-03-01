//
//  ViewController.swift
//  NekokichiKadai3
//
//  Created by Nekokichi on 2022/02/28.
//

import UIKit

final class ViewController: UIViewController {
    // 数値を入力し、Modelのプロパティへ格納するので、動詞のinputを含めた
    @IBOutlet weak private var inputNum1Field: UITextField!
    @IBOutlet weak private var inputNum2Field: UITextField!
    // 表示する値の変数名、UILabelのLabelだけをくっつけた
    // StringやTextかは考慮しないので、含めなかった
    @IBOutlet weak private var num1Label: UILabel!
    @IBOutlet weak private var num2Label: UILabel!
    // 数値の符号（英語：sign）を反転（英語：toggle）する
    @IBOutlet weak private var toggleSignOfNum1: UISwitch!
    @IBOutlet weak private var toggleSignOfNum2: UISwitch!
    // 計算結果を表示するだけなので、動詞は含めず、名詞を含めた
    @IBOutlet weak private var calculatedResultLabel: UILabel!

    private var calculateAdditionModel: CalculateAdditionModel = CalculateAdditionModel()

    // 計算結果をUILabelで表示させるので、動詞のdisplayを使用
    // 計算はModelで行うので、動詞のcalculateは含めず
    @IBAction func displayCalculatedResult(_ sender: UIButton) {
        // 数値の符号を反転させる処理、計算処理などを一箇所にまとめた
        // 理由は、UITextFieldやUISwitchで行うと、処理の流れが複雑になってしまうため
        let num1 = Int(inputNum1Field.text ?? "") ?? 0
        let num2 = Int(inputNum2Field.text ?? "") ?? 0
        if case toggleSignOfNum1.isOn = true {
            calculateAdditionModel.setNum1(-num1)
        } else {
            calculateAdditionModel.setNum1(num1)
        }
        if case toggleSignOfNum2.isOn = true {
            calculateAdditionModel.setNum2(-num2)
        } else {
            calculateAdditionModel.setNum2(num2)
        }
        num1Label.text = "\(calculateAdditionModel.num1)"
        num2Label.text = "\(calculateAdditionModel.num2)"
        calculatedResultLabel.text = "\(calculateAdditionModel.result())"
    }
}
