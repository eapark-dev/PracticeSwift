//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct StoryBrain{
    let story = [Story(t: "You see a fork in the road.", c1: "Take a left.", c2: "Take a right"),
                 Story(t: "You see a tiger.", c1: "Shout for help.", c2: "Play dead."),
                 Story(t: "You find a treasure chest.", c1: "Open it.", c2: "Check for traps.")
                ]
    
    var storyNumber = 0
    
    func choice1() -> String{
        return story[storyNumber].choice1
    }
    
    func choice2() -> String{
        return story[storyNumber].choice2
    }
    
    func checkStory(_ userChoice:String) -> String {
        if userChoice == story[storyNumber].choice1 {
            return story[1].title
        }else{
            return story[2].title
        }
    }
    
    func getStoryText() -> String {
        return story[storyNumber].title
    }
    
    mutating func nextStory(){
        if storyNumber + 1 < story.count {
            storyNumber += 1
        }else{
            storyNumber = 0
        }
    }
}
