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
    // TextFieldのデータを配列
    private var inputTextFields: [UITextField] {[inputValueLeft, inputValueRight]}
    private var minusSwitches: [UISwitch] {[isOpeletorLeft, isOpeletorRigth]}
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextFields.forEach {
            $0.keyboardType = .numberPad
        }
    }
    @IBAction private func calculateButton(_ sender: UIButton) {
        let inputNumbers = inputTextFields.map { Int($0.text ?? "") ?? 0 }
        let signedNumbers: [Int] = zip(inputNumbers, minusSwitches)
            .map { (inputNumber, minusSwitch) -> Int in
                switch Sign(isMinus: minusSwitch.isOn)?.apply(num: inputNumber) {
                case .success(let value):
                    return value
                case .failure, nil:
                    return 0
                }
            }
        inputValueLabelLeft.text = String(signedNumbers[0])
        inputValueLabelRight.text = String(signedNumbers[1])
        sumValue.text = String(signedNumbers.reduce(0, +))
    }
}
