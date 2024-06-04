import SwiftUI

extension Laphet {
    struct Garnish: Ingredient {
        
        
        static var imageAssetPrefix: String = "garnish"
        
        var name: String
        var imageAssetName: String
        var flavors: FlavorProfile
        
        var backgroundColor: Color {
            Color.orange.opacity(0.5)
        }
        
        var isSelected: Bool = false
    }
}

extension Laphet.Garnish {
    static let rostedSesame = Laphet.Garnish(
        name: "Roasted Sesame", 
        imageAssetName: "roasted-sesame",
        flavors: FlavorProfile(bitter: 1))
    
    static let rawGarlic = Laphet.Garnish(
        name: "Raw garlic", 
        imageAssetName: "raw-garlics",
        flavors: FlavorProfile(spicy: 1))
    
    static let driedShrimp = Laphet.Garnish(
        name: "Dried shrimps",
        imageAssetName: "dried-shrimps",
        flavors: FlavorProfile(savory: 3))
    
    static let redChilli = Laphet.Garnish(
        name: "Red Chilli", 
        imageAssetName: "red-chillis",
        flavors: FlavorProfile(spicy: 4))
    
    static let tomatoes = Laphet.Garnish(
        name: "Tomatoes",
        imageAssetName: "tomatoes",
        flavors: FlavorProfile(sweet: 2, sour: 1))
    
    static let lime = Laphet.Garnish(
        name: "Lime",
        imageAssetName: "lime",
        flavors: FlavorProfile(sour: 2))
    
    static let all: [Laphet.Garnish] = [rostedSesame, rawGarlic, driedShrimp, redChilli, tomatoes, lime]
}
