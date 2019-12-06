//
//  GameTabViewController.swift
//  DemoGroupProject
//
//  Created by Komasquin Lopez on 11/14/19.
//  Copyright © 2019 Komasquin Lopez. All rights reserved.
//

import Foundation
import UIKit

class GameTabViewController: UIViewController {
    @IBAction func ticTacToeButton(_ sender: Any) {
        performSegue(withIdentifier: "TicTacToe", sender: sender)
    }
    @IBAction func SnakeButton(_ sender: Any) {
        performSegue(withIdentifier: "Snake", sender: sender)
    }
    @IBAction func OthelloButton(_ sender: Any) {
        performSegue(withIdentifier: "Othello", sender: sender)
    }
}
