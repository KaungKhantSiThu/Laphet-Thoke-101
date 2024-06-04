import SwiftUI

protocol Ingredient: Identifiable, Hashable {
    var id: String { get }
    var name: String { get }
    var flavors: FlavorProfile { get }
    var imageAssetName: String { get }
    static var imageAssetPrefix: String { get }
}

extension Ingredient {
    var id: String { "\(Self.imageAssetPrefix)/\(name)" }
}

extension Ingredient {
    func image(thumbnail: Bool) -> Image {
        Image("\(imageAssetName)")
    }
}
