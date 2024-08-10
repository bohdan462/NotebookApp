//
//  NoteSummary.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 6/28/24.
//

import SwiftUI

struct NoteSummary: View {
    
    var note: Note
    
    
    var body: some View {
        HStack {
            
            note.starred
            ? Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
                .padding(.trailing)
                .onTapGesture {
                    note.starred = false
                }
            
            : Image(systemName: "star")
                .foregroundStyle(.yellow)
                .padding(.trailing)
                .onTapGesture {
                    note.starred = true
                }

            VStack {
                Text(note.title)
                    .font(.headline)
                    .frame(height: 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(note.body)
                    .frame(height: 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    NoteSummary(note: Note(title: "my note", body: "Some text for my note, and this note is very long"))
}
