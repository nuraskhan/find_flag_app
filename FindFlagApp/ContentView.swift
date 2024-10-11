//
//  ContentView.swift
//  FindFlagApp
//
//  Created by Aldongarov Nuraskhan on 08.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var europe = Continent(name: "Europe", countries: [])
    @State var africa = Continent(name: "Africa", countries: [])
    @State var america = Continent(name: "America", countries: [])
    @State private var selectedCountry: Country?
    @State private var correctAnswer: Country?
    @State private var options: [Country] = []
    
    var body: some View {
        ZStack {
            VStack {
                headerView
                
                Spacer()
                
                if let country = selectedCountry {
                    country.flagImage
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding()
                } else {
                    Text("Loading...")
                        .font(.title)
                        .padding()
                }
                
                Spacer()
                
                if !options.isEmpty {
                    questionView
                }
                
                Spacer()
            }
        }
        .onAppear {
            initializeCountries()
            generateQuestion()
        }
    }
    
    var headerView: some View {
        HStack {
            backButton
            Spacer()
            Text("World")
                .font(.headline)
            Spacer()
            humburgerButton
        }
        .padding()
    }
    var backButton: some View {
        Button(action: {
            print("Back button tapped")
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .frame(minHeight: 20)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.gray.opacity(0.7))
            .cornerRadius(10)
        }
    }
    var humburgerButton: some View {
        Button(action: {
            print("Hamburger menu button tapped")
        }) {
            HStack {
                Image(systemName: "line.horizontal.3")
                    .frame(minHeight: 20)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.gray.opacity(0.7))
            .cornerRadius(10)
        }
    }
    var questionView: some View {
        VStack {
            Text("Country with famous car brands")
                .font(.headline)
            
            HStack {
                ForEach(options.prefix(2), id: \.name) { country in
                    answerButton(country)
                }
            }
            
            HStack {
                ForEach(options.suffix(2), id: \.name) { country in
                    answerButton(country)
                }
            }
        }
    }
    
    func answerButton(_ country: Country) -> some View {
        Button {
            checkAnswer(selected: country)
        } label: {
            Text(country.name)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
    
    func checkAnswer(selected: Country) {
        if selected.name == correctAnswer?.name {
            print("Correct!")
        } else {
            print("Wrong answer!")
        }
    }
    
    func initializeCountries() {
        let estonia = Country(name: "Estonia", flagImage: Image("Estonia"), continent: europe)
        let france = Country(name: "France", flagImage: Image("France"), continent: europe)
        let germany = Country(name: "Germany", flagImage: Image("Germany"), continent: europe)
        let ireland = Country(name: "Ireland", flagImage: Image("Ireland"), continent: europe)
        let italy = Country(name: "Italy", flagImage: Image("Italy"), continent: europe)
        let monaco = Country(name: "Monaco", flagImage: Image("Monaco"), continent: europe)
        let nigeria = Country(name: "Nigeria", flagImage: Image("Nigeria"), continent: africa)
        let poland = Country(name: "Poland", flagImage: Image("Poland"), continent: europe)
        let spain = Country(name: "Spain", flagImage: Image("Spain"), continent: europe)
        let uk = Country(name: "UK", flagImage: Image("UK"), continent: europe)
        let ukraine = Country(name: "Ukraine", flagImage: Image("Ukraine"), continent: europe)
        let us = Country(name: "US", flagImage: Image("US"), continent: america)
        
        europe.addCountry(estonia)
        europe.addCountry(france)
        europe.addCountry(germany)
        europe.addCountry(ireland)
        europe.addCountry(italy)
        europe.addCountry(monaco)
        europe.addCountry(poland)
        europe.addCountry(spain)
        europe.addCountry(uk)
        europe.addCountry(ukraine)

        africa.addCountry(nigeria)
        america.addCountry(us)
    }
    
    func generateQuestion() {
        if let correctAnswer = europe.countries.randomElement() {
                selectedCountry = correctAnswer
                
                var incorrectOptions = europe.countries
                .shuffled().prefix(3)
                
                options = Array(incorrectOptions) + [correctAnswer]
                options.shuffle()
            }
    }
}

#Preview {
    ContentView()
}

// GENERAL TUTOR

//        ZStack(){
//            VStack(spacing:0){
//                Color.red
//                Color.blue
//            }
//
//            Text("Hello, world!").foregroundStyle(.secondary).padding(50).background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
//    }
//        LinearGradient(stops:[
//            .init(color:.white, location: 0.45),
//            .init(color:.black, location: 0.55),
//        ], startPoint: .top , endPoint: .bottom)


// USING GRADIENT

//        Text("Hello, world!")
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//            .foregroundStyle(.white)
//            .padding(50)
//            .background(.indigo.gradient)

//        Button {
//            print("Button is tapped!")
//        } label:{
//            Label("Edit", systemImage: "pencil")
//                .padding()
//                .foregroundStyle(.white)
//                .background(.red)
//        }
