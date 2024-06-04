//
//  SwiftUIView.swift
//  
//
//  Created by Kaung Khant Si Thu on 15/02/2024.
//

import SwiftUI

struct LaphetGallery: View {
    @Bindable var model: LaphetModel
    @State private var layout = BrowserLayout.list
    @State private var sort = LaphetSortOrder.name
    @State private var sortFlavor = Flavor.spicy
    
    @State private var searchText = ""
        
    var filterLaphets: [Laphet] {
        model.laphets(sortedBy: sort).filter {
            $0.matches(searchText: searchText)
        }
    }
    
    var tableImageSize: Double {
        #if os(macOS)
        return 30
        #else
        return 60
        #endif
    }
    
    var body: some View {
        ZStack {
            switch layout {
            case .grid:
                grid
            case .list:
                table
            }
        }
        .background()
        #if os(iOS)
        .toolbarRole(.browser)
        #endif
        .toolbar {
            ToolbarItemGroup {
                toolbarItems
            }
        }
        .onChange(of: sortFlavor) { _, newValue in
            if case .flavor = sort {
                sort = .flavor(newValue)
            }
        }
        .searchable(text: $searchText, prompt: Text("Salad name or Ingredients"))
        .navigationDestination(for: Laphet.ID.self) { laphetID in
            SaladMaker(laphet: model.laphetBinding(id: laphetID))
        }
//        .navigationDestination(for: String.self) { _ in
//            SaladMaker(laphet: $model.newLaphet)
//        }
    }
    
    @ViewBuilder
    var toolbarItems: some View {
//        NavigationLink(value: "New Laphet Salad") {
//            Label("Prepare Laphet", systemImage: "plus")
//        }
        
        Menu {
            Picker("Layout", selection: $layout) {
                ForEach(BrowserLayout.allCases) {
                    Label($0.title, systemImage: $0.imageName)
                }
            }
            .pickerStyle(.inline)
            
            
        } label: {
            Label("Layout Options", systemImage: layout.imageName)
                .labelStyle(.iconOnly)
        }
        
        Menu {
            Picker("Sort", selection: $sort) {
                Label("Name", systemImage: "textformat")
                    .tag(LaphetSortOrder.name)
                Label("Flavor", systemImage: "fork.knife")
                    .tag(LaphetSortOrder.flavor(sortFlavor))
            }
            .pickerStyle(.inline)

            if case .flavor = sort {
                Picker("Flavor", selection: $sortFlavor) {
                    ForEach(Flavor.allCases) { flavor in
                        Text(flavor.name)
                            .tag(flavor)
                    }
                }
                .pickerStyle(.inline)
            }
        } label: {
            Label("Sort Options", systemImage: "line.3.horizontal.decrease.circle")
                .labelStyle(.iconOnly)
                .symbolVariant(.fill)
        }
    }
    
    var grid: some View {
        GeometryReader { proxy in
            ScrollView {
                LaphetGalleryGrid(laphets: filterLaphets, width: proxy.size.width)
            }
        }
    }
    
    var table: some View {
        Table(filterLaphets) {
            TableColumn("Name") { laphet in
                NavigationLink(value: laphet.id) {
                    HStack {
                        LaphetView(laphet: laphet)
                            .frame(width: tableImageSize, height: tableImageSize)
                        Text(laphet.name)
                    }
                }
            }
            TableColumn("Top Flavor") { laphet in
                let flavor = laphet.flavors.mostPotentFlavor
                NavigationLink(value: laphet.id) {
//                    HStack(spacing: 4) {
//                        Text(flavor.symbol)
//                        Text(flavor.name)
//                    }
//                    .font(.subheadline)
//                    .foregroundStyle(.white)
//                    .padding(5)
//                    .background(.gray.opacity(0.3), in: .capsule)
                    TagView(flavor: flavor)
                }
            }
        }
    }
}

enum BrowserLayout: String, Identifiable, CaseIterable, Hashable {
    case grid
    case list

    var id: Self {
        self
    }

    var title: LocalizedStringKey {
        switch self {
        case .grid: return "Icons"
        case .list: return "List"
        }
    }

    var imageName: String {
        switch self {
        case .grid: return "square.grid.2x2"
        case .list: return "list.bullet"
        }
    }
}

struct LaphetGallery_Previews: PreviewProvider {
    struct Preview: View {
        @State private var model = LaphetModel.preview

        var body: some View {
            LaphetGallery(model: model)
        }
    }

    static var previews: some View {
        NavigationStack {
            Preview()
        }
    }
}
