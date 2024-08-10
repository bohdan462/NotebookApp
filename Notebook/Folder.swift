//
//  Folder.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 8/10/24.
//

import Foundation
import SwiftData

@Model
class Folder: Hashable, Identifiable {
    var id = UUID()
    var name: String
    
    @Relationship
    var notes: [Note]
    
    var count: Int {
        get {
            return self.notes.count
        }
    }
    
    init(name: String, notes: [Note] = []) {
        self.name = name
        self.notes = notes
    }
    
    static func == (lhs: Folder, rhs: Folder) -> Bool {
        lhs.id == rhs.id
    }
}
