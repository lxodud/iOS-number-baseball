//
//  RockScissorPaperReferee.swift
//  NumberBaseball
//
//  Created by 이태영 on 2023/02/23.
//

import Foundation

final class RockScissorPaperReferee: Refereeable {
    func startRound() {
        printRockScissorPaperMenu()
        guard let userHandNumber = getUserHandNumber() else {
            startRound()
            return
        }
        
        guard let hands = setHandType(userHandNumber) else {
            return
        }
        
        compareHandsForRSP(from: hands)
    }
    
    private func printRockScissorPaperMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }

    private func getUserHandNumber() -> Int? {
        let input = readLine()
        return validateUserHandNumber(input: input)
    }

    private func validateUserHandNumber(input: String?) -> Int? {
        guard let input = input,
              let userHandNumber = Int(input),
              userHandNumber <= 3,
              userHandNumber >= 0
        else {
            print("잘못된 입력입니다. 다시 시도해 주세요")
            return nil
        }
        return userHandNumber
    }

    private func setHandType(_ userHandNumber: Int) -> (HandType, HandType)? {
        guard let userHand = HandType(rawValue: userHandNumber),
              let computerHand = HandType(rawValue: Int.random(in: 1...3))
        else {
            return nil
        }
        return (userHand, computerHand)
    }

    private func compareHandsForRSP(from hands: (HandType, HandType)) {
        switch hands {
        case let (user, computer) where user == computer:
            print("비겼습니다!")
            startRound()
        case (.scissor, .paper), (.paper, .rock), (.rock, .scissor):
            print("이겼습니다!")
            startRound()
        default:
            print("졌습니다!")
            startRound()
        }
    }
}
