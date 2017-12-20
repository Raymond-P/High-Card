//: Playground - noun: a place where people can play

import UIKit

func fillDeck(){
    
    var cardList: [(Double,Double)] = []
    
    
    for val in 2...14{
        
        for rank in 1...4{
            let tempTuple = (val: Double(val), ran: Double(rank))
            print(tempTuple)
            cardList.append(tempTuple)
            
        }
    }
    
    print(cardList.count)
//    let tuple = cardList.remove(at: Int(arc4random_uniform(UInt32(cardList.count))))
    
}

fillDeck()