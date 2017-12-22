//
//  Theme.swift
//  Concentration
//
//  Created by John Palevich on 12/21/17.
//  Copyright © 2017 John Palevich. All rights reserved.
//

import Foundation
import UIKit
struct Theme {
    var emoji:[String]
    var cardColor : UIColor
    var backgroundColor : UIColor
}
let themes = [Theme(emoji:["🤔","😭","😡","😤","🤯","🤑","🤫","😱"],cardColor : UIColor.yellow, backgroundColor : UIColor.black),
              Theme(emoji:["🎄","🎅","🎁","🌟","❄️","⛄️","🤶","🦌"],cardColor : UIColor.green, backgroundColor : UIColor.red),
              Theme(emoji:["⚽️","🏈","🎾","⚾️","🏀","🏉","🎱","🏐"],cardColor : UIColor.white, backgroundColor : UIColor.green),
              Theme(emoji:["🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓"],cardColor : UIColor.magenta, backgroundColor : UIColor.cyan),
              Theme(emoji:["🙀","🎃","😈","👹","👻","🧛‍♂️","🧟‍♂️","🦇"],cardColor : UIColor.orange, backgroundColor : UIColor.black),
              Theme(emoji:["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"],cardColor : UIColor.purple, backgroundColor : UIColor.white)]
