//
//  SaladMaker.swift
//
//
//  Created by Kaung Khant Si Thu on 13/02/2024.
//

import SwiftUI

struct SaladMaker: View {
    @Binding var laphet: Laphet
        
    @Environment(LaphetModel.self) var model: LaphetModel
    
    @State private var bodyToggles: [Laphet.Body: Bool] = Dictionary(uniqueKeysWithValues: Laphet.Body.all.map { ($0, false)})
    @State private var garnishToggles: [Laphet.Garnish: Bool] = Dictionary(uniqueKeysWithValues: Laphet.Garnish.all.map { ($0, false)})
                
    init(laphet: Binding<Laphet>) {
        self._laphet = laphet
    }
    

    
    var body: some View {
        ZStack {
            WidthThresholdReader { proxy in
                if proxy.isCompact {
                    Form {
                        laphetView
                        makerContent
                        tips
                    }
                } else {
                    HStack(spacing: 0) {
                        laphetView
                        Divider().ignoresSafeArea()
                        Form {
                            makerContent
                            tips
                        }
                        .formStyle(.grouped)
                        .frame(width: 350)
                    }
                }
            }
        }
    }
    
    var laphetView: some View {
        LaphetView(laphet: laphet)
            .frame(minWidth: 150, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
            .listRowInsets(.init())
            .padding(.horizontal, 40)
            .padding(.vertical)
            .background()
    }
    
    var flavorProfile: some View {
        Section("Flavor Profile") {
            Grid {
                let (topFlavor, topFlavorValue) = laphet.flavors.mostPotent
                ForEach(Flavor.allCases) { flavor in
                    let isTopFlavor = topFlavor == flavor
                    let flavorValue = max(laphet.flavors[flavor], 0)
                    GridRow(alignment: .top) {
                        Text(flavor.symbol)
                            .padding(5)
                            .background(
                                Circle()
                                    .fill(isTopFlavor ? Color.accentColor : Color.gray.opacity(0.5))
                            )
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text(flavor.name)
                                    .gridCellAnchor(.leading)
                                    .foregroundStyle(isTopFlavor ? .primary : .secondary)
                                Spacer()
                                Text(flavorValue.formatted())
                                    .gridCellAnchor(.trailing)
                                    .foregroundStyle(isTopFlavor ? .primary : .secondary)
                            }
                            
                            ProgressView(value: Double(flavorValue), total: Double(topFlavorValue))

                            .tint(isTopFlavor ? Color.accentColor : Color.secondary)
                        }
                    }
                }
            }
        }
    }
    
    var tips: some View {
        Section("Tips") {
            Label("Mix well", systemImage: "1.circle.fill")
            Label("Don't eat before sleep", systemImage: "2.circle.fill")
        }
    }
    
    @ViewBuilder
    var makerContent: some View {
        Section("Name") {
            TextField("Name", text: $laphet.name, prompt: Text("Laphet Name"))
                .foregroundStyle(laphet.readOnly ? .secondary : .primary)
        }
        .disabled(laphet.readOnly)
        
        flavorProfile
        
        Section("Ingredients") {
            Picker("Base", selection: $laphet.base) {
                ForEach(Laphet.Base.all) { base in
                    Text(base.name)
                        .tag(base)
                }
            }
            
            GroupBox("Body") {
                ForEach(Array(bodyToggles.keys)) {
                    key in
                    Toggle(isOn: bodyBinding(for: key)) {
                        Text(key.name)
                    }
                }
                .toggleStyle(CheckBoxToggleStyle())
            }
            
            GroupBox("Garnish") {
                ForEach(Array(garnishToggles.keys)) {
                    key in
                    Toggle(isOn: garnishBinding(for: key)) {
                        Text(key.name)
                    }
                }
                .toggleStyle(CheckBoxToggleStyle())
            }
            
            Picker("Dressing", selection: $laphet.dressing) {
                
                Section {
                    Text("None")
                        .tag(nil as Laphet.Dressing?)
                }
                Section {
                    ForEach(Laphet.Dressing.all) { dressing in
                        Text(dressing.name)
                            .tag(dressing as Laphet.Dressing?)
                    }
                }
            }
        }
        .disabled(laphet.readOnly)

    }
    
    private func bodyBinding(for key: Laphet.Body) -> Binding<Bool> {
        return Binding(get: {
            return laphet.matches(searchText: key.name)
        }, set: {
            if $0 == true {
                laphet.add(ingredient: key)
            } else {
                laphet.remove(ingredient: key)
            }
            self.bodyToggles[key] = $0
        })
    }
    
    private func garnishBinding(for key: Laphet.Garnish) -> Binding<Bool> {
        return Binding(get: {
            return laphet.matches(searchText: key.name)
        }, set: {
            if $0 == true {
                laphet.add(ingredient: key)
            } else {
                laphet.remove(ingredient: key)
            }
            self.garnishToggles[key] = $0
        })
    }
}

struct SaladMaker_Previews: PreviewProvider {
    struct Preview: View {
        @State private var laphet = Laphet.preview
        @State private var model = LaphetModel.preview
        var body: some View {
            SaladMaker(laphet: $laphet)
                .environment(model)
        }
    }
    
    static var previews: some View {
        NavigationStack {
            Preview()
        }
    }
}
