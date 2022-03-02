//
//  ViewController.swift
//  NekokichiKadai3
//
//  Created by Nekokichi on 2022/02/28.
//

import UIKit

final class ViewController: UIViewController {
    // 数値を入力し、Modelのプロパティへ格納するので、動詞のinputを含めた
    @IBOutlet weak private var num1TextField: UITextField!
    @IBOutlet weak private var num2TextField: UITextField!
    // 表示する値の変数名、UILabelのLabelだけをくっつけた
    // StringやTextかは考慮しないので、含めなかった
    @IBOutlet weak private var num1Label: UILabel!
    @IBOutlet weak private var num2Label: UILabel!
    // 数値の符号（英語：sign）を反転（英語：toggle）する
    @IBOutlet weak private var signOfNum1Switch: UISwitch!
    @IBOutlet weak private var signOfNum2Switch: UISwitch!
    // 計算結果を表示するだけなので、動詞は含めず、名詞を含めた
    @IBOutlet weak private var calculatedResultLabel: UILabel!

    private var calculateAdditionModel: CalculateAdditionModel = CalculateAdditionModel()

    // 計算結果をUILabelで表示させるので、動詞のdisplayを使用
    // 計算はModelで行うので、動詞のcalculateは含めず
    @IBAction func displayCalculatedResult(_ sender: UIButton) {
        // 数値の符号を反転させる処理、計算処理などを一箇所にまとめた
        // 理由は、UITextFieldやUISwitchで行うと、処理の流れが複雑になってしまうため
        let num1: Int = Int(num1TextField.text ?? "") ?? 0
        let num2: Int = Int(num2TextField.text ?? "") ?? 0

        calculateAdditionModel.setInput(
            num1: num1,
            isSignValue1: signOfNum1Switch.isOn,
            num2: num2,
            isSignValue2: signOfNum2Switch.isOn
        )

        num1Label.text = "\(calculateAdditionModel.signedNum1)"
        num2Label.text = "\(calculateAdditionModel.signedNum2)"
        calculatedResultLabel.text = "\(calculateAdditionModel.result())"
    }
}
