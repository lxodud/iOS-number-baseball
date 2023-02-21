//
//  NumberBaseBallReferee.swift
//  NumberBaseball
//
//  Created by 이태영 on 2023/02/21.
//

import Foundation

class NumberBaseBallReferee {
    func decide(
        comparing randomNumber: [Int],
        with userNumber: [Int]
    ) -> (strike: Int, ball: Int) {
        let strike = checkStrike(comparing: randomNumber, with: userNumber)
        let ball = checkBall(comparing: randomNumber, with: userNumber)
        
        return (strike, ball)
    }
    
    private func checkBall(comparing randomNumber: [Int], with userNumber: [Int]) -> Int {
        var ballCount: Int = 0
        
        for (index, value)  in userNumber.enumerated() {
            if (randomNumber.contains(value)) && (userNumber[index] != randomNumber[index]) {
                ballCount += 1
            }
        }
        return ballCount
    }

    private func checkStrike(comparing randomNumber: [Int], with userNumber: [Int]) -> Int {
        var strikeCount: Int = 0
        
        for (index, _) in randomNumber.enumerated() {
            if randomNumber[index] == userNumber[index] {
                strikeCount += 1
            }
        }
        return strikeCount
    }
}
