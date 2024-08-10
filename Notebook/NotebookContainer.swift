//
//  NotebookContainer.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 8/7/24.
//

import Foundation
import SwiftData
import SwiftUI

class NotebookContainer {
    @MainActor static func create() -> ModelContainer {
        let schema = Schema([Note.self])
        let configurations = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: configurations)
        
        if isEmpty(context: container.mainContext) {
            populateData().forEach { note in
                container.mainContext.insert(note)
            }
        }
        
        return container
    }
    
    private static func isEmpty(context: ModelContext) -> Bool {
        if context.container.schema.entities.count == 0 {
            return true
        }
        return false
    }
    
    private static func populateData() -> [Note] {
        
        return [
            Note(title: "Shopping List", body: "Buy milk, eggs, bread, and butter. Also, don't forget to get some vegetables and fruits."),
            Note(title: "Meeting Reminder", body: "Meeting with the marketing team at 3 PM. Prepare the quarterly report and slides for the presentation."),
            Note(title: "Workout Plan", body: "Monday: Chest and Triceps, Tuesday: Back and Biceps, Wednesday: Legs and Shoulders, Thursday: Rest, Friday: Full Body."),
            Note(title: "Vacation Plan", body: "Trip to Hawaii. Pack swimwear, sunscreen, camera, and sunglasses. Book activities like snorkeling and hiking."),
            Note(title: "Birthday Reminder", body: "John's birthday on July 20th. Buy a gift and plan a surprise party. Invite friends and arrange for a cake."),
            Note(title: "Recipe Idea", body: "Chocolate cake recipe: 2 cups of flour, 1 cup of sugar, 1 cup of cocoa powder, 1 tsp baking powder, 2 eggs, 1 cup of milk. Bake at 350°F for 30 minutes.")
        ]
    }
}
