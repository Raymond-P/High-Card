//
//  DeckModel.swift
//  High Hand
//
//  Created by Raymond Perez on 12/17/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import Foundation


struct Deck{
    
    var deck: [Card];
    
    //instead of rebuilding the deck whenever it
    //becomes empty. we will repopulate it with 
    //discarded cards at random to avoid repeated
    //cards in the deck and hands
    var discardPile: [Card];
    
    
    init() {
        
        var cardList: [(Double,Double)] = []
        
        for val in 2...14{
            for rank in 1...4{
                
                let tempTuple = (val: Double(val), ran: Double(rank))
                print(tempTuple)
                cardList.append(tempTuple)
                
            }
        }
        
        var newDeck:[Card] = []
        
        while !cardList.isEmpty{
            //get a  random index from the list
            let ranIndex = Int(arc4random_uniform(UInt32(cardList.count)))
            
            let tempTuple = cardList.remove(at: ranIndex)
            print("tuple selected: \(tempTuple)")
            print("val: \(tempTuple.0)")
            print("ran: \(tempTuple.1)")
            print("tuples left: \(cardList.count)")
            newDeck.append(Card(cardValue: tempTuple.0, cardSuit: tempTuple.1))
            
        }
        print(cardList)
        print(cardList.count)
        self.deck = newDeck
        self.discardPile = []
        
    }
    
    
    private mutating func refillDeck(){
        
        while !discardPile.isEmpty{
            //get a  random index from the list
            let ranIndex = Int(arc4random_uniform(UInt32(discardPile.count)))
            
            self.deck.append(discardPile.remove(at: ranIndex))
            
        }
        
    }
    
    mutating func drawCard() -> Card {
        if deck.count < 1{
            refillDeck()
        }
        let drawnCard = deck.popLast()
        self.discardPile.append(drawnCard!)
        return drawnCard!
        
    }
    
    mutating func returnToDeck(card: Card) {
        deck.insert(card, at: 0)
    }
    

}
