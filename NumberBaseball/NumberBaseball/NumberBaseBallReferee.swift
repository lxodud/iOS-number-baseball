//
//  NumberBaseBallReferee.swift
//  NumberBaseball
//
//  Created by 이태영 on 2023/02/21.
//

import Foundation

protocol Refereeable {
    func startRound()
}

final class NumberBaseBallReferee: Refereeable {
    private let randomNumberMaker: RandomNumberMaker
    private var randomNumber: [Int] = []
    private let maxCoin: Int
    
    init(randomNumberMaker: RandomNumberMaker, maxCoin: Int) {
        self.randomNumberMaker = randomNumberMaker
        self.maxCoin = maxCoin
    }
    
    func startRound() {
        setRandomNumber()
        var currentCoin = maxCoin
        
        while currentCoin != 0 {
            guard let userNumber = getUserNumber() else {
                print("입력이 잘못되었습니다.")
                printInputNumberRule()
                continue
            }
            
            let strike = checkStrike(with: userNumber)
            let ball = checkBall(with: userNumber)

            print("\(strike) 스트라이크, \(ball) 볼")
            
            if strike == 3 {
                print("사용자 승리!")
                return
            }
            
            currentCoin -= 1
            print("남은기회: \(currentCoin)")
        }
        
        print("컴퓨터 승리!")
        return
    }
    
    private func setRandomNumber() {
        randomNumber = randomNumberMaker.creatRandomNumber()
    }
    
    private func checkBall(with userNumber: [Int]) -> Int {
        var ballCount: Int = 0
        
        for (index, value)  in userNumber.enumerated() {
            if (randomNumber.contains(value)) && (userNumber[index] != randomNumber[index]) {
                ballCount += 1
            }
        }
        return ballCount
    }

    private func checkStrike(with userNumber: [Int]) -> Int {
        var strikeCount: Int = 0
        
        for (index, _) in randomNumber.enumerated() {
            if randomNumber[index] == userNumber[index] {
                strikeCount += 1
            }
        }
        
        return strikeCount
    }
    
    private func printInputNumberRule() {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
    }
    
    private func getUserNumber() -> [Int]? {
        printInputNumberRule() 
        print("입력 : ", terminator: "")
        guard let userInput = readLine() else { return nil }
        let userNumber = verifyUserInput(userInput)
        
        return userNumber
    }
    
    private func verifyUserInput(_ userInput: String) -> [Int]? {
        let userInputNumber: [Int] = userInput
            .components(separatedBy: " ")
            .compactMap { Int($0) }
            .filter { $0 > 0 && $0 < 10}
        
        if userInputNumber.count != 3,
           Set(userInputNumber).count != 3 {
            return nil
        }
        
        return userInputNumber
    }
}
