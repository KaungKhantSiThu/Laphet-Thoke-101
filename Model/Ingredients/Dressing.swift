import SwiftUI

extension Laphet {
    struct Dressing: Ingredient {
       
        
        static var imageAssetPrefix: String = "dressing"
        
        var name: String
        var imageAssetName: String
        var flavors: FlavorProfile
        
        var backgroundColor: Color {
            Color.orange.opacity(0.5)
        }
        
    }
}

extension Laphet.Dressing {
    static let peanutOil = Laphet.Dressing(
        name: "Peanut Oil", 
        imageAssetName: "oil",
        flavors: FlavorProfile(savory: 3))
    
    static let sunflowerOil = Laphet.Dressing(
        name: "Sunflower Oil", 
        imageAssetName: "oil",
        flavors: FlavorProfile(savory: 2))
    
    static let oliveOil = Laphet.Dressing(
        name: "Olive Oil", 
        imageAssetName: "oil",
        flavors: FlavorProfile(savory: 3))
    
    static let all: [Laphet.Dressing] = [sunflowerOil, peanutOil, oliveOil]
}
