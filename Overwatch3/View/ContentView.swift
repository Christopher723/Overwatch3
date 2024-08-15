//
//  ContentView.swift
//  MajorasFlask
//
//  Created by Christopher Woods on 10/31/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @ObservedObject var Overwatch = OverwatchViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        NavigationStack{
            ZStack{
                Color(Color.heroBack)
                    .ignoresSafeArea(.all)
                
                
                ScrollView{
                    LazyVGrid(columns: columns, spacing:20){
                        ForEach(Overwatch.heros) { hero in
                            NavigationLink(destination: HeroDetailView(hero: hero)) {
                                VStack{
                                    
                                    
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 105, height: 145)
                                            .foregroundStyle(.white)
                                        VStack{
                                            KFImage(URL(string: "https://noshirtpenguin.pythonanywhere.com/heros/\(hero.name)/Icon"))
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 100, maxHeight: 150)
                                            
                                            HStack(spacing: 0){
                                                AsyncImageView(role: hero.role)
                                                Text(hero.name)
                                                    .scaledToFill()
                                                    .minimumScaleFactor(0.5)
                                                    .lineLimit(3)
                                                    .font(.title2)
                                                    .bold()
                                                    .frame(maxWidth: 60)
                                                    .fixedSize(horizontal: false, vertical: true)
                                                
                                                
                                            }
                                            Spacer()
                                        }
                                    }
                                }
                        }.accentColor(Color.black)
                            
                            
                    }
                        
                    }
                }
                
                
            }
        }
        
        .tint(.black)
        //end of naviagtion stkac
        
    }
}


#Preview {
    ContentView()
}

struct AsyncImageView: View {
    var role: String
    var body: some View {
        AsyncImage(url: URL(string: "https://noshirtpenguin.pythonanywhere.com/image/\(role)/Icon")){
            phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 30, maxHeight: 20
                    )
                    .padding(0)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                
                EmptyView()
            }
        }
        
    }
    
}
