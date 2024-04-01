

import Foundation

class DetailHeroViewModel: ObservableObject{
    @Published var heroDetails = HeroDetailResponse(
        abilities: [Ability(description: "Charge forward and stom enemies. You are unstoppable while charging.", imageURL: "https://127.0.0.1:5000/image/Overrun", name: "Test"),
                    Ability(description: "Charge forward and stomp to launch enemies. You are unstoppable while charging.Charge forward and stomp to launch enemies. You are unstoppable while charging.Charge forward and stomp to launch enemies. You are unstoppable while charging.Charge forward and stomp to launch enemies. You are unstoppable while charging.", imageURL: "https://127.0.0.1:5000/image/Overrun", name: "Overrun")],
                                                    base: "Michigan",
                                                    bio: "One of the founding members of Overwatch, Ana uses her skills and expertise to defend her home and the people she cares for.",
                                                    birthday: "Nov 3 (Age: 40)",
                                                    imageURL: "http://127.0.0.1:5000/heros/JunkerQueen/Icon",
                                                    name: "Christopher",
                                                    story: "Mauga Malosi was born to challenge the system. Previously the member of the eco-rebel group, the Deepsea Raiders, he is now a Talon mercenary, wreaking havoc all around the world. Wherever he goes, he knows how to have a good time.")
    
    private let service = Overwatch3DataService()
    
    
    func fetchHeroDetail(hero: String) {
        service.fetchHeroDetails(hero: hero) { detailObject in
            DispatchQueue.main.async{
                self.heroDetails = detailObject
            }
        }
        
    }
    
    
}

