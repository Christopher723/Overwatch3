//
//  PokemonViewModel.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import Foundation

class OverwatchViewModel: ObservableObject{
    @Published var heros = [Hero]()
    
    
    
    private let service = Overwatch3DataService()
    init() {
        fetchHeros()
        
    }
    
    func fetchHeros() {
        service.fetchItems() { heroArray in
            DispatchQueue.main.async{
                self.heros = heroArray
            }
        }
        
    }
    
    
}

