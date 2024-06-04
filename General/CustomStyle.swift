//
//  CustomStyle.swift
//
//
//  Created by Kaung Khant Si Thu on 13/02/2024.
//

import SwiftUI

struct CheckBoxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            Button(action: { configuration.isOn.toggle() }){
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "checkmark.square")
                    .foregroundStyle(configuration.isOn ? Color.accentColor : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
            
        }
    }
}

extension ToggleStyle where Self == CheckBoxToggleStyle {
    static var checkbox: Self { .init() }
}

struct CheckBoxToggleStyle_Preview: View {
    @State private var isOn = false
    var body: some View {
        Form {
            Toggle("Box 1", isOn: $isOn)
                .toggleStyle(CheckBoxToggleStyle())
            
            Toggle("Box 1", isOn: $isOn)
                .toggleStyle(CheckBoxToggleStyle())
                .disabled(true)
        }
    }
}

#Preview {
    CheckBoxToggleStyle_Preview()
}
