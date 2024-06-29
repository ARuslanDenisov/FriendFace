//
//  NetService.swift
//  FriendFace
//
//  Created by Руслан on 28.06.2024.
//

import Foundation

struct NetService {
    
    static let shared = NetService() ; private init () { }
    
    func loadData() async -> [PersonModel] {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode([PersonModel].self, from: data) {
                return decodedResponse
            }
        } catch {
            print("Invalid data")
        }
        return []
    }
    
}
