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
    private(set) var signedNum1: Int = 0
    private(set) var signedNum2: Int = 0

    mutating func setInput(
        num1: Int,
        isSignValue1: Bool,
        num2: Int,
        isSignValue2: Bool
    ) {
        self.signedNum1 = isSignValue1 ? -num1 : num1
        self.signedNum2 = isSignValue2 ? -num2 : num2
    }

    // structの型名で足し算だと推測できるので、関数名はresultのみ
    func result() -> Int {
        signedNum1 + signedNum2
    }
}
