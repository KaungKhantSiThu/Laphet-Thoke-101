//
//  FlavorProfileGrid.swift
//
//
//  Created by Kaung Khant Si Thu on 12/02/2024.
//

import SwiftUI

struct FlavorProfileGrid: View {
    var body: some View {
        Section("Flavor Profile") {
            Grid {
                let (topFlavor, topFlavorValue) = (Flavor.savory, 4)
                ForEach(Flavor.allCases) { flavor in
                    let isTopFlavor = topFlavor == flavor
                    let flavorValue = max(Int.random(in: 0...3), 0)
                    GridRow {
                        Text(flavor.symbol)
                        
                        Text(flavor.name)
                            .gridCellAnchor(.leading)
                            .foregroundStyle(isTopFlavor ? .primary : .secondary)
                        
                        Gauge(value: Double(flavor == .savory ? 4 : flavorValue), in: 0...Double(topFlavorValue)) {
                            EmptyView()
                        }
                        .tint(isTopFlavor ? Color.accentColor : Color.secondary)
                        .labelsHidden()
                        
                        Text(flavorValue.formatted())
                            .gridCellAnchor(.trailing)
                            .foregroundStyle(isTopFlavor ? .primary : .secondary)
                    }
                }
            }
        }
    }
}

struct FlavorProfileGrid_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            FlavorProfileGrid()
        }
    }
}
