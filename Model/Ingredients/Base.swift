import SwiftUI

extension Laphet {
    struct Base: Ingredient {
        
        var name: String
        var imageAssetName: String
        
        static var imageAssetPrefix: String = "base"
        var flavors: FlavorProfile
        
        var backgroundColor: Color {
            Color.green.opacity(0.5)
        }
    }
}

extension Laphet.Base {
    static let classic = Laphet.Base(
        name: "Classic",
        imageAssetName: "laphet",
        flavors: FlavorProfile(salty: 1, bitter: 2, savory: 1))
    
    static let sourAndSpicy = Laphet.Base(
        name: "Sour and Spicy", 
        imageAssetName: "laphet",
        flavors: FlavorProfile(salty: 1, sour: 2, savory: 1, spicy: 2))
    
    static let all: [Laphet.Base] = [classic, sourAndSpicy]
}
