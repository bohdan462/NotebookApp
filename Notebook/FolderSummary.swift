//
//  FolderSummary.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 8/10/24.
//

import SwiftUI

struct FolderSummary: View {
    var name: String
    var count: Int
    
    var body: some View {
        HStack {
            Image(systemName: "folder.fill")
            Text("\(name): \(count) items")
        }
       
    }
}

#Preview {
    FolderSummary(name: "Test", count: 5)
}
