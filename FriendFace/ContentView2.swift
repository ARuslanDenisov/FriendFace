//
//  ContentView2.swift
//  FriendFace
//
//  Created by Руслан on 29.06.2024.
//

import SwiftUI

import SwiftUI
import SwiftData

struct ContentView2: View {
    @Query var persons: [PersonModel]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(persons) { user in
                    NavigationLink(value: user) {
                        VStack(alignment: .leading){
                            Text(user.name)
                                .font(.headline)
                            Text(user.isActive ? "Active" : "Not Active")
                                .font(.subheadline)
                                .foregroundStyle(user.isActive ? .green : .red)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: PersonModel.self) { person in
                PersonElement(person: person)
            }
            .task {
                if persons.isEmpty {
                    await fetchData()
                }
            }
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("1")
            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .iso8601
            print("zahodin v decoder")
            let decodedUsers = try decoder.decode([PersonModel].self, from: data)
                print("in decodUsers")
              for user in decodedUsers {
                  print(user.name)
                  modelContext.insert(user)
              
            }
            
        } catch {
            print("Error fetching data")
        }
    }
}

#Preview {
    ContentView2()
}
