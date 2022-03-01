//
//  CalculateModel.swift
//  NekokichiKadai3
//
//  Created by Nekokichi on 2022/02/28.
//

import UIKit

// classよりも、値型であるstructが推奨されている
struct CalculateAdditionModel {
    // privateだと、取得と変更を行う関数を用意する必要がある
    // 値の変更は影響度が高いので、変更のみを関数で実装
    // 値の取得は影響度がないので、プロパティから取得可能にした
    private(set) var num1: Int = 0
    private(set) var num2: Int = 0
    
    // 引数には、num1と区別するために、value1を設定
    mutating func setNum1(_ value1: Int) {
        num1 = value1
    }
    
    mutating func setNum2(_ value2: Int) {
        num2 = value2
    }
    
    // structの型名で足し算だと推測できるので、関数名はresultのみ
    func result() -> Int {
        num1 + num2
    }
}
