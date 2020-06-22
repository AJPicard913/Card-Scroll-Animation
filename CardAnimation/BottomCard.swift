//
//  BottomCard.swift
//  CardAnimation
//
//  Created by AJ Picard on 6/19/20.
//  Copyright © 2020 AJ Picard. All rights reserved.
//

import SwiftUI

struct BottomCard: View {
    
   
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            ForEach(CardInfoData) { item in
                CardContent(cardInfo: item)

            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .background(Color(#colorLiteral(red: 0.1700507614, green: 0.1700507614, blue: 0.1700507614, alpha: 1)))
    .cornerRadius(30)
    }
}

struct BottomCard_Previews: PreviewProvider {
    static var previews: some View {
        BottomCard()
    }
}

struct CardInfo: Identifiable {
    var id = UUID()
    var icon: String
    var name: String
    var time: String
    var charge: String
}

let CardInfoData = [
    CardInfo(icon: "star", name: "HBO", time: "Today", charge: "-$6.27"),
    CardInfo(icon: "arrow.clockwise", name: "Spotify", time: "Yesterday", charge: "-$9.99"),
    CardInfo(icon: "bag", name: "Acme Clothing", time: "Yesterday", charge: "-$36.89"),
    CardInfo(icon: "suit.heart", name: "Dentist Clinic", time: "May 17th", charge: "-$104.00"),
    CardInfo(icon: "arrow.clockwise", name: "Patreon", time: "May 16th", charge: "-$3.99")
    
    
    
]

struct CardContent: View {
    
    var cardInfo: CardInfo
    
    var body: some View {
        HStack {
            Image(systemName: cardInfo.icon)
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                .cornerRadius(20)
                .padding(.leading, 30)
            
            VStack(alignment: .leading) {
                Text(cardInfo.name)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Text(cardInfo.time)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            }
            
            Spacer()
            Text(cardInfo.charge)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.trailing, 30)
            
        }
        .padding(.vertical, 10)
    }
}
