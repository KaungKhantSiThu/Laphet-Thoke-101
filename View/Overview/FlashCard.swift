//
//  SlideCard.swift
//
//
//  Created by Kaung Khant Si Thu on 13/02/2024.
//

import SwiftUI

struct FlashCard: View {
    let info: Info
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.fern)
            
            VStack(alignment: .leading) {
                Text(info.title)
                    .font(.system(size: 40))
                    .bold()

                HStack {
                    Spacer()
                    info.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
//                        .padding()
                        
                    Spacer()
                }
                
                Text(info.explanation)
                    .font(.system(size: 24))

            }
            .padding(30)
            .foregroundStyle(.white)
            
        }
    }
}

struct SlideCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            FlashCard(info: .introduction)
                .cardStyle(cornerRadius: 25)
                .aspectRatio(0.7, contentMode: .fit)
                .padding()
                .frame(width: 500)
        }
    }
}
