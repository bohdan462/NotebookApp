//
//  NotebookApp.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 6/28/24.
//

import SwiftUI
import SwiftData

@main
struct NotebookApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Note.self)
        }
    }
}
