func addExpAndGold(exp: Int, gold: Int) {
    
    let myData = sharedData
    var myExp = exp
    
    myData.gold += gold
    
    while myExp >= myData.expToNextLvl - myData.exp {
        
        myData.level += 1
        
        myExp -= myData.expToNextLvl - myData.exp
        
        myData.exp = 0
        
        myData.expToNextLvl += 200
        
    }
    
    myData.exp += myExp
    
}

func ReturnCategory(quest: Quest) -> String {
    
    switch(quest.icon) {
        
    case "text.page":
        return "Default"
    case "shippingbox":
        return "Delivery"
    case "shield.lefthalf.filled":
        return "Escort"
    case "archivebox":
        return "Fetch"
    case "dumbbell":
        return "Training"
    case "hammer":
        return "Crafting"
    case "puzzlepiece.extension":
        return "Puzzle"
        default:
        return "Unknown"
        
    }
}
