//
//  ContentView.swift
//  CardAnimation
//
//  Created by AJ Picard on 6/18/20.
//  Copyright © 2020 AJ Picard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var CardMove = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Breakdown")
                    .font(.system(size: 19, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .opacity(CardMove ? 1 : 0)
                
                Text("Current Balance")
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    .font(.system(size: 19, weight: .medium, design: .rounded))
                    .opacity(CardMove ? 0 : 1)

                Text("$11,502")
                    .foregroundColor(.white)
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .padding(.top, 4)
                    .opacity(CardMove ? 0 : 1)

            }
            .offset(y: CardMove ? -275 : -250)
            .animation(.spring())
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 20) {
                    ForEach(cardData) { item in
                        GeometryReader { geometry in
                            Cards(CardMove: self.$CardMove, card: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 20) / 30), axis: (x: 10, y: -20, z: 0))
                        }
                         .frame(width: 375, height: 200)
                    }
                   
                }
                .frame(height: 350)
                .padding(.leading, 25.0)
            }
            .padding(.top, CardMove ? -250 : 50)
            .animation(.spring())
            
            
            BottomCard()
                .offset(y: CardMove ? 250 : 1000)
                .animation(.spring())
        }
        .animation(.spring())
     
        .onTapGesture {
            self.CardMove = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Cards: View {
    
    @Binding var CardMove: Bool
    
    var card: Card
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [card.linearOne, card.linearTwo]), startPoint: .bottomLeading, endPoint: .topTrailing)
            VStack {
                
                HStack {
                    // First four circles
                    HStack (spacing: 5) {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                    }
                    .padding(.leading, 30)
                    HStack (spacing: 5) {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                    }
                    HStack (spacing: 5) {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.white).opacity(0.7)
                        
                    }
                    
                    Text(card.number)
                        .foregroundColor(.white).opacity(0.7)
                        .font(.system(size: 19, weight: .bold, design: .rounded))
                    
                    Spacer()
                }
                .padding(.top, 25)
                
                
                
                Spacer()
                
                HStack {
                    Text(card.total)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    Spacer()
                    
                    
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white).opacity(0.7)
                            .padding(.trailing, 40)
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white).opacity(0.7)
                    }
                    
                    
                }
                .padding(.bottom, 25)
            }
            
        }
        .frame(width: 325, height: 200)
        .cornerRadius(25)
        .rotationEffect(.degrees(CardMove ? 0 : 90))
        .animation(.spring())

        .onTapGesture {
            self.CardMove = true
        }
    }
}


struct Card: Identifiable {
    var id = UUID()
    var number: String
    var total: String
    var linearOne: Color
    var linearTwo: Color
}

let cardData = [
    Card(number: "1234", total: "$1,564", linearOne: Color(#colorLiteral(red: 0.4392156863, green: 0.1058823529, blue: 1, alpha: 1)), linearTwo: Color(#colorLiteral(red: 0.631372549, green: 0.4078431373, blue: 1, alpha: 1))),
    Card(number: "4567", total: "$1,814", linearOne: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), linearTwo: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
    Card(number: "7890", total: "$64", linearOne: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), linearTwo: Color(#colorLiteral(red: 0.631372549, green: 0.4078431373, blue: 1, alpha: 1))),
    Card(number: "1356", total: "$12,564", linearOne: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), linearTwo: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))),
    Card(number: "7653", total: "$564", linearOne: Color(#colorLiteral(red: 0.4392156863, green: 0.1058823529, blue: 1, alpha: 1)), linearTwo: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
    
]
