//
//  CalculateModel.swift
//  KadaiChallenge3
//
//  Created by 岡優志 on 2021/05/23.
//

import UIKit
class Operator {
    enum Operator {
        case addision
        case subtraction
        // 初期化
        init?(isOn: Bool) {
            switch isOn {
            case true: self = .addision
            case false: self = .subtraction
            }
        }
        /// opeでBoolがtrue = +num, false = -num
        func isOperatorValue(ope: Operator, num: Int)-> Result<Int, Error> {
            func apply(_ ope: (Int) -> Int) -> Result<Int, Error> {
                .success(ope(num))
            }
            switch ope {
            case .addision:
                return apply(+)
            case .subtraction:
                return apply(-)
            }
        }
    }
}
