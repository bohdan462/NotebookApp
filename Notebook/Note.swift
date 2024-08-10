//
//  Note.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 6/28/24.
//

import Foundation
import SwiftData

@Model
class Note: Identifiable, Hashable {
    var id: UUID = UUID()
    var title: String
    var body: String
    var starred: Bool = false
    
    @Relationship(inverse: \Folder.notes)
    var folder: Folder? = nil
    
    init(title: String, body: String, folder: Folder? = nil) {
        self.title = title
        self.body = body
        self.folder = folder
    }
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
