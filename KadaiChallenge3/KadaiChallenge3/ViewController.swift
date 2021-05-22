//
//  ViewController.swift
//  KadaiChallenge3
//
//  Created by 岡優志 on 2021/05/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var inputValueLeft: UITextField!
    @IBOutlet private weak var inputValueRight: UITextField!
    @IBOutlet private weak var inputValueLabelLeft: UILabel!
    @IBOutlet private weak var inputValueLabelRight: UILabel!
    @IBOutlet private weak var sumValue: UILabel!
    @IBOutlet private weak var isOpeletorLeft: UISwitch!
    @IBOutlet private weak var isOpeletorRigth: UISwitch!
    // TextFieldのデータを配列に入れまとめる
    private var relayValues: [UITextField] {[inputValueLeft, inputValueRight]}
    private var isOpelators: [UISwitch] {[isOpeletorLeft, isOpeletorRigth]}
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in relayValues {
            item.keyboardType = .numberPad
        }
    }
    @IBAction private func calculateButton(_ sender: UIButton) {
        var values = relayValues.map({ Int($0.text ?? "") ?? 0 })
        // 解答Pt1
        //        for num in 0..<values.count {
        //            values[num] = isOpelators[num].isOn ? values[num] : -values[num]
        //        }
        //        let sum = values.reduce(0, +)
        //        inputValueLabelLeft.text = String(values[0])
        //        inputValueLabelRight.text = String(values[1])
        //        sumValue.text = String(sum)
        //
        // ここから下は解答Pt2
        for num in 0..<values.count {
            values[num] = {
                guard let ope = Operator(isOn: isOpelators[num].isOn) else {
                    return 0
                }
                switch ope.isOperatorValue(ope: ope, num: values[num]) {
                case .success(let value):
                    return value
                default: return 0
                }
            }()
        }
        inputValueLabelLeft.text = String(values[0])
        inputValueLabelRight.text = String(values[1])
        sumValue.text = String(values.reduce(0, +))
    }
    //     演算子のenum
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
