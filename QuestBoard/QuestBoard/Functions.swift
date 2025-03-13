import UserNotifications

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

func getItemByName(myData: SharedData, name: String) -> Item {
    
    for index in 0..<myData.items.count {
        if myData.items[index].accessoryName == name {
            return myData.items[index]
        }
    }
    return Item(accessoryName: "", stats: [0,0,5,0,3,0,7], itemImage: [""], iconImage: "", cost: 100, itemLayers: [])
}

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if let error = error {
            print("Error requesting notifications: \(error.localizedDescription)")
        }
    }
}

func scheduleTaskReminder(taskName: String, thresholdDate: Date) {
    let notificationCenter = UNUserNotificationCenter.current()
    
    // Calculate the trigger time (1 hour before the threshold)
    let triggerDate = Calendar.current.date(byAdding: .hour, value: -1, to: thresholdDate) ?? thresholdDate
    
    // Create the notification content
    let content = UNMutableNotificationContent()
    content.title = "Beware: \(taskName)"
    content.body = "Your quest will be over soon!"
    content.sound = .default
    
    // Set up the trigger
    let trigger = UNCalendarNotificationTrigger(
        dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate),
        repeats: false
    )
    
    // Create the request
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // Add the notification request
    notificationCenter.add(request) { error in
        if let error = error {
            print("Error scheduling notification: \(error.localizedDescription)")
        }
    }
}

func returnCategory(icon: String) -> String {
    
    switch(icon) {
    case "text.page": return "Default"
    case "shippingbox": return "Delivery"
    case "shield.lefthalf.filled": return "Escort"
    case "archivebox": return "Fetch"
    case "dumbbell": return "Training"
    case "hammer": return "Crafting"
    case "puzzlepiece.extension": return "Puzzle"
    default: return "Unknown"
    }
}
