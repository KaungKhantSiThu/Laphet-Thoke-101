//
//  SwiftUIView.swift
//  
//
//  Created by Kaung Khant Si Thu on 24/02/2024.
//

import SwiftUI

struct TagView: View {
    @Environment(\.colorScheme) var colorScheme
    let flavor: Flavor
    var body: some View {
        HStack {
            Text(flavor.symbol)
            Text(flavor.name)
                .foregroundStyle(colorScheme == .light ? .black : .white)
        }
        .padding(6)
        .background(flavor.color, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .font(.caption)
    }
}
