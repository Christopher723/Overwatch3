//
//  PokemonService.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import Foundation

class Overwatch3DataService {
    let URLString: String = "https://noshirtpenguin.pythonanywhere.com/heros"

    
    func fetchItems(completion: @escaping([Hero]) -> Void) {
        guard let url = URL(string: URLString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received.")
                return
            }

            do {
                let response = try JSONDecoder().decode(OverwatchResponse.self, from: data)
                let heros = response.Heros
                completion(heros)
                
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    func fetchHeroDetails(hero: String, completion: @escaping(HeroDetailResponse) -> Void) {
        guard let url = URL(string: "https://noshirtpenguin.pythonanywhere.com/heros/\(hero)") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received.")
                return
            }

            do {
                let response = try JSONDecoder().decode(HeroDetailResponse.self, from: data)
                completion(response)
                
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    
    
    
    
    
    
}
