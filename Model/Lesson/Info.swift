import SwiftUI

struct Info: Identifiable, Hashable {
    let id: Int
    let title: String
    let explanation: String
    let imageName: String
    
    var image: Image {
        Image(imageName)
    }
}

extension Info {

    static let introduction = Info(
        id: 1,
        title: "Introduction",
        explanation: "Discover the Unique Flavors of Laphet Thoke: Burmese Fermented Tea Leaf Salad",
        imageName: "laphet_plate"
    )

    static let origin = Info(
        id: 2,
        title: "Origin",
        explanation: "Unique to Burma, fermented tealeaf salad or Laphet is eaten by all people regardless of race or religion",
        imageName: "myanmar_map"
    )
    
    static let localSaying = Info(
        id: 3,
        title: "Local Saying",
        explanation: "Of all the fruits, mango's the best;\nOf all the meat, pork's the best;\nOf all leaves, laphet's the best",
        imageName: "popular_saying")

    static let ingredients = Info(
        id: 4,
        title: "Ingredients",
        explanation: "Uses fresh vegetables, and assorted fried beans to create a well-balanced combination of flavor and texture",
        imageName: "ingredients"
    )

    static let culturalSignificance = Info(
        id: 5,
        title: "Cultural Significance",
        explanation: "Laphet is not just a dish; it's a symbol of hospitality and friendship in Burmese culture, often shared among friends and family during gatherings and celebrations",
        imageName: "burmese_couple"
    )


    static let healthBenefits = Info(
        id: 6,
        title: "Health Benefits",
        explanation: "Rich in antioxidants from the fermented tea leaves and nutrient-packed nuts, Laphet offers both flavorful indulgence and potential health benefits.",
        imageName: "health"
    )

    static let howToLaphet = Info(
        id: 7,
        title: "Making Laphet",
        explanation: "Steam fresh tea leaf for 5-10 minutes. Squeeze the water out and let it ferment naturally for 2 weeks. Hard press the water out and you got Burmese fermented tea leaf",
        imageName: "recipe_book"
    )

//    static let conclusion = Info(
//        id: 8,
//        title: "Conclusion",
//        explanation: "Experience the exotic flavors and cultural richness of Myanmar with Lappet, a delightful fermented tea leaf salad that promises to tantalize your taste buds.",
//        imageName: "laphet_plate"
//    )

    static let all = [introduction, origin, localSaying, ingredients, culturalSignificance, healthBenefits, howToLaphet]
}
