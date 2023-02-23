//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

enum Game: String {
    case numberBaseball = "1"
    case rockScissorPaper = "2"
}

func start(with game: Game) {
    var gameDescirptor: GameDescriptor?
    
    switch game {
    case .numberBaseball:
        let randomNumberMaker = RandomNumberMaker()
        let numberBaseballReferee = NumberBaseBallReferee(randomNumberMaker: randomNumberMaker, maxCoin: 9)
        gameDescirptor = GameDescriptor(referee: numberBaseballReferee)
    case .rockScissorPaper:
        let rockScissorPaperReferee = RockScissorPaperReferee()
        gameDescirptor = GameDescriptor(referee: rockScissorPaperReferee)
    }

    gameDescirptor?.startGame()
}

var selectedGame: Game?

while selectedGame == nil {
    print("게임을 선택해주세요!")
    print("1. 숫자 야구")
    print("2. 가위바위보")
    print("입력: ", terminator: "")
    
    guard let userInput = readLine(),
          let game = Game(rawValue: userInput)
    else {
        print("잘못된 입력입니다! 다시 입력해주세요")
        continue
    }
    
    selectedGame = game
}

if let selectedGame = selectedGame {
    start(with: selectedGame)
}




