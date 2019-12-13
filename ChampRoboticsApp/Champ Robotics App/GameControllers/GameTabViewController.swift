//
//  GameTabViewController.swift
//  DemoGroupProject
//
//	Created By:
//	Noah Ortega 5454548 & Komasquin Lopez 5959569

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
