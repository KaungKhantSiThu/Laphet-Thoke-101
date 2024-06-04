//
//  LaphetModel.swift
//
//
//  Created by Kaung Khant Si Thu on 13/02/2024.
//

import SwiftUI


@Observable
class LaphetModel {
    var laphets: [Laphet] = Laphet.all
    var newLaphet: Laphet
    
    init() {
        self.newLaphet = Laphet(
            id: Laphet.all.count,
            name: "",
            base: .classic,
            body: [.friedBeans],
            garnish: [.rostedSesame])
    }
    
    func laphets<S: Sequence>(fromIDs ids: S) -> [Laphet] where S.Element == Laphet.ID {
        ids.map { laphet(id: $0) }
    }
    
    func laphet(id: Laphet.ID) -> Laphet {
        laphets[id]
    }
    
    func laphetBinding(id: Laphet.ID) -> Binding<Laphet> {
        Binding<Laphet> {
            self.laphets[id]
        } set: { newValue in
            self.laphets[id] = newValue
        }
    }
    
    func updateLaphet(id: Laphet.ID, to newValue: Laphet) {
        laphetBinding(id: id).wrappedValue = newValue
    }
    
    func add(_ laphet: Laphet) {
        laphets.append(laphet)
    }
    
    func delete(_ laphet: Laphet) {
        laphets.removeAll { $0.id == laphet.id }
    }
    
    func laphets(sortedBy sort: LaphetSortOrder = .name) -> [Laphet] {
        switch sort {
        case .name:
            return laphets.sorted { $0.name.localizedCompare($1.name) == .orderedAscending }
        case .flavor(let flavor):
            return laphets.sorted {
                $0.flavors[flavor] > $1.flavors[flavor]
            }
        }
    }
}

enum LaphetSortOrder: Hashable {
    case name
    case flavor(Flavor)
}

extension LaphetModel {
    static let preview = LaphetModel()
}
