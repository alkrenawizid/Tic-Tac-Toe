//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by ZID Alkrenawi on 8/1/16.
//  Copyright © 2016 Alkrenawi zid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // nought = 1 , crosses = 2
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]
    
    
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        activePlayer = 1
        
        gameActive = true
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        winningCombinations = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]
       
        for i in 0 ..< 9 {
            
        var button : UIButton
            
        button = view.viewWithTag(i) as! UIButton
            
        button.setImage(nil, forState: .Normal)
        
        }
        
        gameOverLabel.hidden = true
        playAgain.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
        
    }
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
            
                image = UIImage(named: "nought.png")!
                
                activePlayer = 2
            
            } else {
                
                image = UIImage(named: "cross.png")!
                
                activePlayer = 1
        }
            
        sender.setImage(image, forState: .Normal)
        
        for combination in winningCombinations {
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                var labelText = "Noughts has won!"
                
                if gameState[combination[0]] == 2{

                    labelText = "Crosses has won!"
                }
                
                gameOverLabel.text = labelText
                
                gameOverLabel.hidden = false
                playAgain.hidden = false
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                    
                    self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)
                })
                    gameActive = false
            }
            
        }
            
      }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        gameOverLabel.hidden = true
        playAgain.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        //gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        //playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
    }

}

