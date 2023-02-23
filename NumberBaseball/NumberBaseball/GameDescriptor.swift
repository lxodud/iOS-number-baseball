//
//  NumberBaseBallMC.swift
//  NumberBaseball
//
//  Created by 이태영 on 2023/02/21.
//

import Foundation

final class GameDescriptor {
    private let referee: Refereeable
    
    init(
        referee: Refereeable
    ) {
        self.referee = referee
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
            startRound()
        case .endGame:
            break
        }
    }
    
    private func startRound() {
        referee.startRound()
        
        startGame()
    }
}


