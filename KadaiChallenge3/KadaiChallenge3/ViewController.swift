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
    var relayValues: [UITextField] {[inputValueLeft, inputValueRight]}
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in relayValues {
            item.keyboardType = .numberPad
        }
    }
    @IBAction private func calculateButton(_ sender: UIButton) {
        let values = relayValues.map({ Int($0.text ?? "") ?? 0 })
        let num1 = isOpeletorLeft.isOn ? values[0] : -values[0]
        let num2 = isOpeletorRigth.isOn ? values[1] : -values[1]
        let sum = num1 + num2
        inputValueLabelLeft.text = String(num1)
        inputValueLabelRight.text = String(num2)
        sumValue.text = String(sum)
    }
}
//     演算子のenum
//    enum Operator {
//        case addision
//        case sucraction
//        // 初期化
//        init(isOn: Bool) {
//            switch isOn {
//            case true: self = .addision
//            case false: self = .sucraction
//            }
//        }
//        func calculate(ope: Operator, num: Int) {
//
//        }
//    }
//}
