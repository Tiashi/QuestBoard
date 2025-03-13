import SwiftUI
import SwiftData

@Model
class Quest {
    
    var name: String
    var descript: String
    var icon: String
    var difficulty: Int
    var isUrgent: Bool
    var exp: Int
    var gold: Int
    var completionThreshold: TimeInterval
    var completed: Bool
    var timeOfCompletion: TimeInterval
    
    init(
        name: String,
        descript: String,
        icon: String,
        difficulty: Int,
        isUrgent: Bool,
        exp: Int,
        gold: Int,
        completionThreshold: TimeInterval,
        completed: Bool,
        timeOfCompletion: TimeInterval
    ) {
        self.name = name
        self.descript = descript
        self.icon = icon
        self.difficulty = difficulty
        self.isUrgent = isUrgent
        self.exp = exp
        self.gold = gold
        self.completionThreshold = completionThreshold
        self.completed = completed
        self.timeOfCompletion = timeOfCompletion
    }

}
