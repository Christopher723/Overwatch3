//
//  HeroDetailView.swift
//  Overwatch3
//
//  Created by Christopher Woods on 3/12/24.
//

import SwiftUI

struct HeroDetailView: View {
    @ObservedObject var Overwatch = DetailHeroViewModel()
    
   
    @State var abilityName = ""
    @State var abilityBio = ""
    
    
    var hero: Hero
    let rows = [
        GridItem(.adaptive(minimum: 100))
    ]

    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing:0){
                    ZStack{
                        Color.detailBack
                        VStack{
                            Spacer().frame(height: 90)
                            VStack(alignment: .leading, spacing: 15)
                            {

                                    HStack(){
                                        Spacer()
                                        Text("\(Overwatch.heroDetails.name)")
                                            .bold()
                                            .font(.system(size: 40,weight: .black))
                                            .foregroundStyle(.white)
                                            .shadow(radius: 20)
                                        
                                        Spacer()
                                    }
                                
                                Text("\(Overwatch.heroDetails.bio)")
                                    .font(
                                        .system(size: 20,weight: .heavy))
                                    .foregroundStyle(.white)
                                    .shadow(radius: 20)
                                
                            }
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                            
                            
                            VStack(alignment: .leading,spacing: 10)
                            {
                                HStack{
                                    Text( Overwatch.heroDetails.birthday)
                                        .font(.system(size: 20,weight: .semibold))
                                        .foregroundStyle(.white)
                                        .shadow(radius: 20)
                                    
                                    Spacer()
                                }
                                Text(Overwatch.heroDetails.base)
                                    .font(.system(size: 20,weight: .semibold))
                                    .foregroundStyle(.white)
                                    .shadow(radius: 20)
                                
                                
                                
                            }
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 30, trailing: 0))
                        }
                    }
                    
                    
                    ZStack{
                        Color.abilityBack.frame(minHeight: 320, maxHeight: 800)
                        VStack{
                            HStack{
                                ScrollView(.horizontal,showsIndicators: false){
                                    LazyHGrid(rows: rows){
                                        ForEach(Overwatch.heroDetails.abilities){ability in
                                            VStack{
                                                AbilityAsyncImage(fullAbilityURL: ability.imageURL)
                                                    .onTapGesture{
                                                        abilityName = ability.name
                                                        abilityBio = ability.description
                                                    }
                                                    .onAppear(){
                                                        abilityName = Overwatch.heroDetails.abilities[0].name
                                                        abilityBio = Overwatch.heroDetails.abilities[0].description
                                                        
                                                    }
                                                
                                            }
                                        }
                                    }
                                    //end of lazy view
                                }//end of horiztonal scrollview
                            }
                            
                            
                            Text(abilityName)
                                .font(.system(size: 30,weight: .heavy))
                                .foregroundStyle(.white)
                                .shadow(radius: 20)
                                .padding(20)
                            Text(abilityBio)
                                .font(.system(size: 20,weight: .semibold))
                                .foregroundStyle(.white)
                                .shadow(radius: 20)
                                .lineLimit(4, reservesSpace: true)
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                            
                        }.padding()
                           //end of ability Vstack
                        
                    }//end of ability zstack
                    
                    ZStack{
                        LinearGradient(colors: [Color.originTop,Color.originBottom], startPoint: .top, endPoint: .bottom)
                            .frame(maxHeight: 600)
                        VStack(spacing: 30){
                            Text("Origin Story")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.white)
                            
                            Text("\(Overwatch.heroDetails.story)")
                                .foregroundStyle(.white)
                                .font(.system(size: 20,weight: .semibold))
                                .shadow(radius: 20)
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                                
                        }
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        
                    }
                    
                }
                
            }//end of scroll view
            
            .task{do{Overwatch.fetchHeroDetail(hero: hero.name)}}
            .ignoresSafeArea(edges: .all)
        }//end of zstack
        

        
        
    }
        
}


#Preview {
    HeroDetailView(hero: Hero(name: "test", role: "test", url: "test"))
}


struct AbilityAsyncImage: View {
    var fullAbilityURL: String
    @State var counter = 0
    @State var myColor: Color = .white
    var body: some View {
        AsyncImage(url: URL(string: fullAbilityURL)){
            phase in
            switch phase {
            case .empty:
                Circle().foregroundStyle(.gray)
            case .success(let image):
                ZStack{
                    Circle()
                        .stroke(myColor, lineWidth: 2)
                        .frame(width: 80, height: 80)
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 60, maxHeight: 60
                        )
                        .padding(0)
                        
                }
            case .failure(let error):
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
    }
}
