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
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
struct Calculate {
    /// 型変換のエラー
    enum Error: Swift.Error {
            case typeConversionError
        }

    /// addition = 加算
    /// subtraction = 減算
    enum Opetator {
        case addition
        case subtraction
    }
}
