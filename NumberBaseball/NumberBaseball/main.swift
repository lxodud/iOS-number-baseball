//
//  NumberBaseball - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

func main() {
    let randomNumberMaker = RandomNumberMaker()
    let referee = NumberBaseBallReferee()
    
    let mc = NumberBaseBallMC(randomNumberMaker: randomNumberMaker, referee: referee, lifeCount: 9)
    
    mc.startGame()
}

main()
