//
//  Model.swift
//  Overwatch3
//
//  Created by Christopher Woods on 3/11/24.
//

import Foundation

struct OverwatchResponse: Codable{
    let Heros: [Hero]
}

struct Hero: Codable, Identifiable, Equatable{
    let id = UUID()
    let name: String
    let role: String
    let url: String
}

struct Ability: Codable, Identifiable, Equatable{
    let id  = UUID()
    let description: String
    let imageURL: String
    let name: String
}


struct HeroDetailResponse: Codable {
    let abilities: [Ability]
    let base: String
    let bio: String
    let birthday: String
    let imageURL: String
    let name: String
    let story: String
}
