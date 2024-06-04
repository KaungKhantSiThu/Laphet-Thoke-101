import SwiftUI

struct Laphet: Identifiable, Hashable {
    var id: Int
    var name: String
    
    var base: Laphet.Base
    var body: [Laphet.Body]
    var garnish: [Laphet.Garnish]
    var dressing: Laphet.Dressing?
    
    var readOnly: Bool
    
    init(id: Int, name: String, base: Laphet.Base, body: [Laphet.Body], garnish: [Laphet.Garnish], dressing: Laphet.Dressing? = nil, readOnly: Bool = false) {
        self.id = id
        self.name = name
        self.base = base
        self.body = body
        self.garnish = garnish
        self.dressing = dressing
        self.readOnly = readOnly
    }
    
    var ingredients: [any Ingredient] {
        var result: [any Ingredient] = []
        result.append(base)
        result.append(contentsOf: body)
        result.append(contentsOf: garnish)
        if let dressing = dressing {
            result.append(dressing)
        }
        return result
    }
    
    var flavors: FlavorProfile {
        ingredients
            .map(\.flavors)
            .reduce(into: FlavorProfile()) { partialResult, next in
                partialResult.formUnion(with: next)
            }
    }
    
    func matches(searchText: String) -> Bool {
        if searchText.isEmpty {
            return true
        }
        
        if name.localizedCaseInsensitiveContains(searchText) {
            return true
        }
        
        return ingredients.contains { ingredient in
            ingredient.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    mutating func add(ingredient: Laphet.Body) {
        self.body.append(ingredient)
    }
    
    mutating func remove(ingredient: Laphet.Body) {
        if let index = self.body.firstIndex(of: ingredient) {
            self.body.remove(at: index)
        }
    }
    
    mutating func add(ingredient: Laphet.Garnish) {
        self.garnish.append(ingredient)
    }
    
    mutating func remove(ingredient: Laphet.Garnish) {
        if let index = self.garnish.firstIndex(of: ingredient) {
            self.garnish.remove(at: index)
        }
    }
}

extension Laphet {
    static let new = Laphet(
        id: 0,
        name: String(localized: ""),
        base: .classic,
        body: [.friedBeans],
        garnish: [.lime],
        dressing: .sunflowerOil
    )
    
    static let classic = Laphet(
        id: 0,
        name: String(localized: "Classic"),
        base: .classic,
        body: [.friedBeans],
        garnish: [.lime],
        dressing: .sunflowerOil,
        readOnly: true
    )
    
    static let hotAndSpicy = Laphet(
        id: 1,
        name: String(localized: "Spicy"),
        base: .sourAndSpicy,
        body: [.friedBeans],
        garnish: [.redChilli, .tomatoes],
        dressing: .sunflowerOil,
        readOnly: true
    )
    
    static let extraSpicy = Laphet(
        id: 2,
        name: String(localized: "Extra Spicy"),
        base: .sourAndSpicy,
        body: [.friedBeans],
        garnish: [.redChilli, .tomatoes],
        dressing: .sunflowerOil,
        readOnly: true
    )
    
    static let yangonThote = Laphet(
        id: 3,
        name: String(localized: "Yangon Style"),
        base: .sourAndSpicy,
        body: [.friedBeans, .friedPeanuts],
        garnish: [.redChilli, .tomatoes],
        dressing: .sunflowerOil,
        readOnly: true
    )
    
    static let mandalayThote = Laphet(
        id: 4,
        name: String(localized: "Mandalay Style"),
        base: .sourAndSpicy,
        body: [.friedBeans],
        garnish: [.redChilli, .tomatoes],
        dressing: .sunflowerOil,
        readOnly: true
    )
    
    static let cornLaphet = Laphet(
        id: 5,
        name: String(localized: "Corn Laphet"),
        base: .sourAndSpicy,
        body: [.friedPeanuts, .sweetCorns],
        garnish: [.tomatoes, .redChilli, .driedShrimp],
        readOnly: true
    )
    
    static let all: [Laphet] = [
        classic, hotAndSpicy, extraSpicy, yangonThote, mandalayThote, cornLaphet
    ]
    
    static var preview: Laphet { .classic }
}
