//
//  ViewController.swift
//  Concentration
//
//  Created by John Palevich on 12/21/17.
//  w © 2017 John Palevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfCardPairs: (cardButtons.count+1)/2)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateCards()
        view.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    var flipCount = 0{didSet {flipCountLabel.text = "Flips: \(flipCount)"}}
    @IBAction func flipCard(_ sender: UIButton) {
        flipCount+=1
        if let index = cardButtons.index(of: sender){
            game.flipCard(cardIndex: index)
            updateCards()
        }
        
    }
    func updateCards(){
        for index in cardButtons.indices{
            let card = game.cards[index]
            let button = cardButtons[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: .normal)
                button.backgroundColor = UIColor.white
            }
            else{
                button.setTitle("", for: .normal)
                if card.isMatched
                {
                    button.backgroundColor = UIColor.clear
                }
                else{
                    button.backgroundColor = UIColor.orange
                }
            }
        }
    }
    var emojiChoices = ["🤔","😭","😡","😤","🤯","🤑","🤫","😱"]
    var emoji = [Int:String]()
    func emoji(for card : Card) -> String{
        if emoji[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

