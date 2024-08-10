//
//  NotesList.swift
//  Notebook
//
//  Created by Bohdan Tkachenko on 6/28/24.
//

import SwiftUI
import SwiftData

enum NavigationDestination: Hashable {
    case NotesList(Folder)
    case Note(Note)
}

struct NotesList: View {
    
    @Environment(\.modelContext) private var context
    
    var currentFolder: Folder?
    
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var showStarredOnly = false
    @State private var isAddingNew = false
    
    @Query var notes: [Note]
    @Query var folders: [Folder]
    
    var body: some View {
        ///Search Field
        HStack {
            Image(systemName: "magnifyingglass")
                .onTapGesture {
                    if !isSearching {
                        isSearching = true
                    }
                }
            if isSearching {
                TextField("Search Notes", text: $searchText)
                Image(systemName: "xmark")
                    .onTapGesture {
                        if isSearching {
                            searchText = ""
                            isSearching = false
                        }
                    }
            }
        }
        .padding([.leading, .trailing])
        
        Toggle("Starred", isOn: $showStarredOnly)
            .padding([.leading, .trailing])
        
        ///List
        NavigationStack {
            List {
                ForEach(folders, id: \.self) { folder in
                    NavigationLink(value: folder) {
                        FolderSummary(name: folder.name, count: folder.count)
                            .padding([.top, .bottom], 10)
                    }
                            .swipeActions {
                                Button(action: {
                                    context.delete(folder)
                                }, label: {
                                    Image(systemName: "trash")
                                }).tint(.red)
                            }
                    }
                    
                    ForEach(notes, id: \.self) { note in
                        NavigationLink(value: note) {
                            NoteSummary(note: note)
                                .padding([.top, .bottom], 10)
                        }
                                .swipeActions {
                                    Button(action: {
                                        context.delete(note)
                                    }, label: {
                                        Image(systemName: "trash")
                                    }).tint(.red)
                                }
                        }
                    }
                
            
            .navigationDestination(for: NavigationDestination.self, destination: { destination in
                switch destination {
                case .NotesList(let folder):
                    NotesList(currentFolder: folder)
                case .Note(let note):
                    NoteDetail(note: note)
                }
            })
        }
        if !isAddingNew {
            ZStack {
                Circle()
                    .fill()
                    .frame(height: 48)
                    .foregroundStyle(.orange)
                Image(systemName: "plus")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .onTapGesture {
                        isAddingNew = true
                    }
            }
            .padding(.top)
        } else {
            HStack {
                ZStack {
                    Circle()
                        .fill()
                        .frame(height: 48)
                        .foregroundStyle(.orange)
                    Image(systemName: "doc.text")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .onTapGesture {
                            context.insert(Note(title: "New note", body: "I am a new note for test.", folder: currentFolder))
                        }
                }
                .padding(.top)
                
                ZStack {
                    Circle()
                        .fill()
                        .frame(height: 48)
                        .foregroundStyle(.red)
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .onTapGesture {
                            isAddingNew = false
                        }
                }
                .padding(.top)
                
                ZStack {
                    Circle()
                        .fill()
                        .frame(height: 48)
                        .foregroundStyle(.orange)
                    Image(systemName: "folder.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .onTapGesture {
                            context.insert(Folder(name: "New Folder"))
                        }
                }
                .padding(.top)
            }
        }
    }
}

#Preview {
    NotesList()
        .modelContainer(for: Note.self)
}
