//
//  RandomNumberMaker.swift
//  NumberBaseball
//
//  Created by 이태영 on 2023/02/21.
//

import Foundation

final class RandomNumberMaker {
    func creatRandomNumber() -> [Int] {
        var randomNumbers: Set<Int> = []
        
        while randomNumbers.count != 3 {
            let randomNumber: Int = Int.random(in: 1...9)
            randomNumbers.insert(randomNumber)
        }
        
        return Array(randomNumbers)
    }
}
