//
//  ContentView.swift
//  FriendFace
//
//  Created by Руслан on 28.06.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var persons: [PersonModel]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    List(persons, id: \.id) { person in
                        NavigationLink(destination: {
                            PersonElement(person: person)
                        }, label: {
                            ZStack {
                                HStack {
                                    Text(person.name)
                                        .frame(width: 200, alignment: .leading)
                                        .lineLimit(1)
                                    Text("\(person.age)")
                                    Spacer()
                                    Circle()
                                        .foregroundStyle(person.isActive ? .green : .red)
                                        .frame(width: 5)
                                }
                            }
                            
                            
                        })
                        
                    }
                    .task {
                        if persons.isEmpty {
                            var personsArray = await NetService.shared.loadData()
                            for pers in personsArray {
                                modelContext.insert(pers)
                            }
                        }
                    }
                }
            }
            .navigationTitle("List of Persons")
            .navigationBarTitleDisplayMode(.inline)
        }
       
    }
}

#Preview {
    ContentView()
}
