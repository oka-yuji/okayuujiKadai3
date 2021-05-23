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
     var isOpelators: [UISwitch] {[isOpeletorLeft, isOpeletorRigth]}
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in relayValues {
            item.keyboardType = .numberPad
        }
    }
//     opeにBool型があればOperatorに従って
     func calculate(_ values: inout [Int], _ operetor: Operator.Type) {
        for num in 0..<values.count {
            values[num] = {
                guard let ope = operetor.Operator(isOn: isOpelators[num].isOn) else {
                    return 0
                }
                switch ope.isOperatorValue(ope: ope, num: values[num]) {
                case .success(let value):
                    return value
                default: return 0
                }
            }()
        }
    }
    @IBAction private func calculateButton(_ sender: UIButton) {
        var values = relayValues.map({ Int($0.text ?? "") ?? 0 })
        let operetor = Operator.self
        calculate(&values, operetor)
        inputValueLabelLeft.text = String(values[0])
        inputValueLabelRight.text = String(values[1])
        sumValue.text = String(values.reduce(0, +))
    }
}

//func calculate(_ values: inout [Int], _ operetor: Operator.Type) {
//    let viewController = ViewController.self
//   for num in 0..<values.count {
//       values[num] = {
//        guard let ope = operetor.Operator(isOn: viewController.init().isOpelators[num].isOn) else {
//               return 0
//           }
//           switch ope.isOperatorValue(ope: ope, num: values[num]) {
//           case .success(let value):
//               return value
//           default: return 0
//           }
//       }()
//   }
//}
