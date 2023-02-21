//
//  NumberBaseBallMC.swift
//  NumberBaseball
//
//  Created by 이태영 on 2023/02/21.
//

import Foundation

final class NumberBaseBallMC {
    private let randomNumberMaker: RandomNumberMaker
    private let referee: NumberBaseBallReferee
    private let randomNumber: [Int]
    private var lifeCount: Int
    
    init(
        randomNumberMaker: RandomNumberMaker,
        referee: NumberBaseBallReferee,
        lifeCount: Int
    ) {
        self.randomNumberMaker = randomNumberMaker
        self.referee = referee
        self.lifeCount = lifeCount
        self.randomNumber = randomNumberMaker.creatRandomNumber()
    }
    
    func startGame() {
        printMenuInformation()
        getSelectedMenu()
    }
    
    private func printMenuInformation() {
        print("1. 게임시작")
        print("2. 게임종료")
        print("원하는 기능을 선택해주세요 : ", terminator: "")
    }
    
    private func getSelectedMenu() {
        guard let inputMenu = readLine(),
              let selectedMenu = Menu(rawValue: inputMenu)
        else {
            startGame()
            return
        }
        
        decideMenu(with: selectedMenu)
    }
    
    private func decideMenu(with inputMenu: Menu) {
        switch inputMenu {
        case .startGame:
            printInputNumberRule()
            startRound()
        case .endGame:
            break
        }
    }
    
    private func startRound() {
        while lifeCount != 0 {
            guard let userNumber = getUserNumber() else {
                print("입력이 잘못되었습니다.")
                printInputNumberRule()
                continue
            }
            
            lifeCount -= 1
            let result = referee.decide(comparing: randomNumber, with: userNumber)
            
            if result.strike == 3 {
                print("사용자 승리!")
                break
            }
            
            print("남은기회 : \(lifeCount)")
        }
        
        if lifeCount == 0 {
            print("컴퓨터 승리...!")
        }
        
        startGame()
    }
    
    private func printInputNumberRule() {
        print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.")
        print("중복 숫자는 허용하지 않습니다.")
    }
    
    private func getUserNumber() -> [Int]? {
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
