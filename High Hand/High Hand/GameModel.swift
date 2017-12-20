//
//  GameModel.swift
//  High Hand
//
//  Created by Raymond Perez on 12/17/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import Foundation


struct HighHand {
    
    var deck:Deck;
    
    var bet: Int;
    
    var tradesLeft: Int;
    
    var comHand: [Card?];
    
    // Player //
    var Cash: Int;
    var playerHand: [Card?]; // ?? how...
    
    
    init() {
        deck = Deck()
        bet = 1
        tradesLeft = 3
        comHand = [nil,nil,nil,nil,nil]
        
        //player//
        
        Cash = 100
        playerHand = [nil, nil, nil, nil, nil]

        
    }
    
    mutating func dealHands(){
        for i in 0...4{
            comHand[i] = deck.drawCard()
            playerHand[i] = deck.drawCard()
        }
    }
    
    mutating func tradeCard(atIndex index: Int){
        playerHand[index] = deck.drawCard()
        
        
    }
    
    func getHandValue(of hand:[Card?]) -> Double{
        var total = 0.0
        for card in hand{
            if (card != nil){
                total += card!.score
            }
        }
        return total
    }
}
