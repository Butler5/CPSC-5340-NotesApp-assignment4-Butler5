//
//  ContentView.swift
//  Notes
//
//  Created by Adam Butler on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var noteApp = NoteViewModel()
    @State var note = NoteModel(title: "", notesdata: "")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($noteApp.notes) { $note in
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text(note.title)
                    }
                }
                Section {
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text("New note")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            
        }
        .onAppear {
            noteApp.fetchData()
        }
        .refreshable {
            noteApp.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
