import SwiftUI

extension Laphet {
    struct Body: Ingredient {
        
        var name: String
        var imageAssetName: String
        var flavors: FlavorProfile
        
        var backgroundColor: Color {
            Color.orange.opacity(0.5)
        }
        
        static var imageAssetPrefix: String = "body"
        
    }
}

extension Laphet.Body {
    static let friedBeans = Laphet.Body(
        name: "Assorted Fried Beans",
        imageAssetName: "fried-beans",
        flavors: FlavorProfile(salty: 1, savory: 1))
    
    static let friedPeanuts = Laphet.Body(
        name: "Fried Peanuts",
        imageAssetName: "fried-peanuts",
        flavors: FlavorProfile(salty: 1, bitter: 1))
    
    static let sweetCorns = Laphet.Body(
        name: "Sweet corns",
        imageAssetName: "sweet-corn",
        flavors: FlavorProfile(sweet: 4))
    
    static let all: [Laphet.Body] = [friedBeans, friedPeanuts, sweetCorns]
}
