//
//  CalculateModel.swift
//  KadaiChallenge3
//
//  Created by 岡優志 on 2021/05/23.
//

import UIKit

    enum Sign {
        case plus
        case minus
        // 初期化
        init?(isMinus: Bool) {
            self = isMinus ? .minus : . plus
        }
        func apply(num: Int)-> Result<Int, Error> {
            switch self {
            case .plus:
                return .success(num)
            case .minus:
                return .success(-num)
            }
        }
    }
