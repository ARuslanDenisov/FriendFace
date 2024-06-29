//
//  PersonElement.swift
//  FriendFace
//
//  Created by Руслан on 28.06.2024.
//

import SwiftUI

struct PersonElement: View {
    var person: PersonModel
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Info")
                        .font(.largeTitle)
                        .padding(.vertical, 10)
                    Spacer()
                    Text( person.isActive ? "Online" : "Offline")
                        .foregroundStyle(person.isActive ? .green : .red)
                }
                HStack {
                    VStack {
                        HStack{
                            Text("Name: ")
                                .frame(width: 90,alignment: .leading)
                                .foregroundStyle(.gray)
                            Text(person.name)
                            Spacer()
                            
                        }
                        HStack{
                            Text("Age: ")
                                .frame(width: 90,alignment: .leading)
                                .foregroundStyle(.gray)
                            Text(person.age.description)
                            Spacer()
                        }
                        HStack{
                            Text("email: ")
                                .frame(width: 90,alignment: .leading)
                                .foregroundStyle(.gray)
                            Text(person.email)
                            Spacer()
                        }
                        HStack{
                            Text("registred: ")
                                .frame(width: 90,alignment: .leading)
                                .foregroundStyle(.gray)
                            Text(person.timeConverter())
                            Spacer()
                        }
                    }
                    
                }
                VStack {
                    HStack {
                        Text("About:")
                            .font(.largeTitle)
                            .padding(.vertical, 10)
                        Spacer()
                    }
                    Text(person.about)
                }
                .padding(.vertical, 20)
                VStack {
                    HStack {
                        Text("Friend's list")
                            .font(.largeTitle)
                            .padding(.vertical, 10)
                        Spacer()
                    }
                    List (person.friends, id: \.id ) { friend in
                        Text(friend.name)
                    }
                    .listStyle(.plain)
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    PersonElement(person: PersonModel(id: "sdsa", isActive: true, name: "Andrew", age: 12, company: "Family", email: "asdfasfsa", address: "Moscow", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: "2015-11-10T01:47:18-00:00", tags: ["moscow","123"], friends: []))
}
