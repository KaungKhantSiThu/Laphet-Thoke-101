//
//  DetailColumn.swift
//
//
//  Created by Kaung Khant Si Thu on 06/02/2024.
//

import SwiftUI

struct DetailColumn: View {
    @Binding var selection: Panel?
    @Bindable var model: LaphetModel
    var body: some View {
        switch selection ?? .overview {
        case .overview:
            Overview()
        case .explore:
            LaphetGallery(model: model)
        case .saladMaker:
            SaladMaker(laphet: $model.newLaphet)
        case .about:
            AboutView()
        }
    }
}

struct DetailColumn_Previews: PreviewProvider {
    
    struct Preview: View {
        @State private var selection: Panel? = .overview
        @State private var model = LaphetModel.preview
        var body: some View {
            DetailColumn(selection: $selection, 
                         model: model)
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
