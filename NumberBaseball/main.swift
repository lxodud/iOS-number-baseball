//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func main() {
    let randomNumberMaker = RandomNumberMaker()
//    let referee = NumberBaseBallReferee(
//        randomNumberMaker: randomNumberMaker,
//        maxCoin: 9
//    )
    
    let referee = RockScissorPaperReferee()
    
    let mc = GameDescriptor(referee: referee)
    
    mc.startGame()
}

main()

