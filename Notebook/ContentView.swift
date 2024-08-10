//
//  ContentView.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 6/28/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        
        HStack {
            Text("Notebook")
                .font(.title)
        }
        .padding([.leading, .trailing])
        NotesList()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Note.self)
}
