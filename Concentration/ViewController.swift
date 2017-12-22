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
        startNewGame()
    }
    var theme : Theme!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func flipCard(_ sender: UIButton) {
        if let index = cardButtons.index(of: sender){
            game.flipCard(cardIndex: index)
            updateCards()
        }
        
    }
    
    @IBAction func newGameStart(_ sender: UIButton) { startNewGame()
    }
    func startNewGame(){
        emoji = [Int:String]()
        theme = themes[Int(arc4random_uniform(UInt32(themes.count)))]
        view.backgroundColor = theme.backgroundColor
        flipCountLabel.textColor = theme.cardColor
        emojiChoices = theme.emoji
        game = Concentration(numberOfCardPairs:(cardButtons.count+1)/2)
        updateCards()
    }
    func updateCards(){
        flipCountLabel.text = "Flips: \(game.flipCount)"
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
                    button.backgroundColor = theme.cardColor
                }
            }
        }
    }
    var emojiChoices = [String]()
    var emoji = [Int:String]()
    func emoji(for card : Card) -> String{
        if emoji[card.identifier] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

