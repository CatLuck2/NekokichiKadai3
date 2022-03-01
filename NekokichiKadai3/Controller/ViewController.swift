//
//  ViewController.swift
//  NekokichiKadai3
//
//  Created by Nekokichi on 2022/02/28.
//

import UIKit

final class ViewController: UIViewController {
    // 表示する値の変数名、UILabelのLabelだけをくっつけた
    // StringやTextかは考慮しないので、含めなかった
    @IBOutlet weak private var num1Label: UILabel!
    @IBOutlet weak private var num2Label: UILabel!
    // 計算結果を表示するだけなので、動詞は含めず、名詞を含めた
    @IBOutlet weak private var calculatedResultLabel: UILabel!

    private var calculateAdditionModel: CalculateAdditionModel = CalculateAdditionModel()

    // 数値を入力し、Modelのプロパティへ格納するので、動詞のinputを含めた
    // 引数のsenderでUITextFieldだと判別できるので、Fieldなどの単語は含めず
    @IBAction func inputNum1(_ sender: UITextField) {
        calculateAdditionModel.setNum1(Int(sender.text ?? "") ?? 0)
    }

    @IBAction func inputNum2(_ sender: UITextField) {
        calculateAdditionModel.setNum2(Int(sender.text ?? "") ?? 0)
    }

    // 数値の符号（英語：sign）を反転（英語：toggle）する
    @IBAction func toggleSignOfNum1(_ sender: UISwitch) {
        // Switch文だとdefaultまで含めてしまうので、パターンマッチで実装
        if case sender.isOn = true {
            // 絶対値を返す、abs()、を使用
            calculateAdditionModel.setNum1(-abs(calculateAdditionModel.num1))
        } else {
            calculateAdditionModel.setNum1(abs(calculateAdditionModel.num1))
        }
    }

    @IBAction func toggleSignOfNum2(_ sender: UISwitch) {
        if case sender.isOn = true {
            calculateAdditionModel.setNum2(-abs(calculateAdditionModel.num2))
        } else {
            calculateAdditionModel.setNum2(abs(calculateAdditionModel.num2))
        }
    }

    // 計算結果をUILabelで表示させるので、動詞のdisplayを使用
    @IBAction func displayCalculatedResult(_ sender: UIButton) {
        num1Label.text = "\(calculateAdditionModel.num1)"
        num2Label.text = "\(calculateAdditionModel.num2)"
        calculatedResultLabel.text = "\(calculateAdditionModel.result())"
    }
}
