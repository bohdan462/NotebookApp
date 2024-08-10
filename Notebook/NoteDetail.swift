//
//  NoteDetail.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 6/28/24.
//

import SwiftUI

struct NoteDetail: View {
    
    @State var note: Note
    
    
    var body: some View {
        VStack {
            Text("Title")
                .font(.caption)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            TextField("Title", text: $note.title)
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 3)
                .cornerRadius(10)
                .overlay (
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.orange, lineWidth: 1)
                )
        }
        .padding()
        
        VStack {
            Text("Note")
                .font(.caption)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            TextEditor(text: $note.body)
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 3)
                .cornerRadius(10)
                .overlay (
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.orange, lineWidth: 1)
                )
        }
        .padding()
    }
}

#Preview {
    NoteDetail(note: Note(title: "my note", body: "Some text for my note, and this note is very long"))
}
