//
//  GameScene.swift
//  Game-Starter-Empty
//
//  Created by Jonathan Kopp on 9/29/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //Initialize score starting at 0
    var score = 0
    
    //Set up properties of the scoreLabel
    var scoreLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "0"
        label.color = .white
        label.fontSize = 50
        
        return label
    }()
    
    override func didMove(to view: SKView) {
        //Called when the scene has been displayed
        
        //Create three squares with the names one,two,three
        createSquares(name: "one")
        createSquares(name: "two")
        createSquares(name: "three")

        //Setup the scoreLabel
        labelSetUp()
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func labelSetUp() {
        scoreLabel.position.x = view!.bounds.width / 2
        scoreLabel.position.y = view!.bounds.height - 80
        addChild(scoreLabel)
    }
    
    func randomNumber()-> CGFloat {
        //Width of the SKScene's view
        let viewsWidth = self.view!.bounds.width
        //Creates a random number from 0 to the viewsWidth
        let randomNumber = CGFloat.random(in: 0 ... viewsWidth)
        
        return randomNumber
    }
    
    func createSquares(name: String) {
        //Set up square properties
        //1. Create a CGSize for the square with (width: 80, height: 80)
        var squareDimensions = CGSize(width: 80, height: 80)
        //2. Create a Square node with a texture of nil. a color of .green and the size we created above
        var squareNode = SKSpriteNode(texture: nil, color: .green, size: squareDimensions)
        //3. Set the squares name to the name we pass into this function
        squareNode.name = name
        
        //Set up the Squares x and y positions
        //1. Squares y positions shoud start at 40
        squareNode.position.y = 40
        //2. Squares x positon should use the randomNumber generator provided above
        squareNode.position.x = randomNumber()

        //Create an action to move the square up the screen
        let action = SKAction.customAction(withDuration: 2.0, actionBlock: { (square, _) in
            //Set up the squares animation
            //1. The squares y position should increase by 10
            squareNode.position.y += 10
            //2. Create an if statement that checks if the squares y position is >= to the screens height
            if squareNode.position.y >= self.view!.frame.height {
                //If it is remove the square and create a new square with the same name
                squareNode.removeFromParent()
                self.createSquares(name: squareNode.name!)
            }
        })
        
        //Have the square run the above animation forever and add the square to the SKScene!
        addChild(squareNode)
        squareNode.run(SKAction.repeatForever(action))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Loop through an array of touch values
        for touch in touches {
            
            //Grab the position of that touch value
            let positionInScene = touch.location(in: self)
            
            //Find the name for the node in that location
            //Note: Changed from name to node. This var used to have .name at the end
            let node = self.atPoint(positionInScene)
            
            //Check if there is an node there.
            if node.name != nil {
                //Remove the square
                //Remove node from parent view
                node.removeFromParent()
                //Increase the score by one
                score += 1
                scoreLabel.text = ("\(score)")
                //Create the square again with the same name
                createSquares(name: node.name!)
            }
        }
    }
    
}
