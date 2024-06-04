//
//  Sidebar.swift
//
//
//  Created by Kaung Khant Si Thu on 06/02/2024.
//

import SwiftUI

enum Panel: String, Identifiable, CaseIterable, Hashable {
    case overview
    case explore
    case saladMaker
    case about
    
    var id: String { name }
    
    var name: String {
        switch self {
        case .overview:
            "Overview"
        case .explore:
            "Gallery"
        case .saladMaker:
            "Salad Maker"
        case .about:
            "About"
        }
    }
    var symbolName: String {
        switch self {
        case .overview:
            "rectangle.portrait.on.rectangle.portrait.angled.fill"
        case .explore:
            "circle.hexagongrid.fill"
        case .saladMaker:
            "fork.knife.circle.fill"
        case .about:
            "info.circle"
        }
    }
}

struct Sidebar: View {
    @Binding var selection: Panel?
    var body: some View {
        List(selection: $selection) {
            ForEach(Panel.allCases) { panel in
                NavigationLink(value: panel) {
                    Label(panel.name, systemImage: panel.symbolName)
                }
            }
        }
        .navigationTitle("Laphet Thoke 101")
        #if os(macOS)
        .navigationSplitViewColumnWidth(min: 200, ideal: 200)
        #endif
    }
}

struct Sidebar_Previews: PreviewProvider {
    struct Preview: View {
        @State private var selection: Panel? = .overview
        var body: some View {
            Sidebar(selection: $selection)
        }
    }
    
    static var previews: some View {
        NavigationSplitView {
            Preview()
        } detail: {
            Text("Detail")
        }

    }
}
