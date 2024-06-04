//
//  AboutView.swift
//
//
//  Created by Kaung Khant Si Thu on 21/02/2024.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        List {
            Section {
                VStack(alignment: .center, spacing: 5) {
                    Text("Developed with \(Image(systemName: "heart.fill")) ")
                        .font(.title2)
                        .bold()
                    Text("by **Kaung Khant Si Thu**")
                        .font(.subheadline)
                }
                .foregroundColor(.white)
                .padding(10)
                .frame(maxWidth: .infinity)
            }
#if os(iOS)
            .listRowBackground(Rectangle().fill(.green.gradient.opacity(0.9)))
#elseif os(macOS)
            .background(.green.gradient.opacity(0.9))
            .cornerRadius(10)
#endif
            
            
            Section {
                Link(destination: URL(string: "https://www.freepik.com/free-vector/vegetable-icons-collection_948406.htm")!) {
                    Text("Vegetable icons")
                }
                
                Link(destination: URL(string: "https://www.freepik.com/free-vector/myanmar-independence-day-map_138418779.htm")!) {
                    Text("Myanmar Map")
                }
                
                Link(destination: URL(string: "https://www.freepik.com/free-vector/prawns-scallops-plate_4453016.htm")!) {
                    Text("Prawns")
                }
                
                Link(destination: URL(string: "https://www.freepik.com/free-vector/somtum-thai-food-spicy-papaya-salad-hand-drawn-cartoon-illustration_31526397.htm")!) {
                    Text("Tomatoes Slices")
                }
                
                Link(destination: URL(string: "https://www.freepik.com/free-vector/hand-drawn-national-doctor-s-day-illustration-with-medics-essentials_27830624.htm")!) {
                    Text("Doctor")
                }
                
                Link(destination: URL(string: "https://www.freepik.com/free-vector/set-book-object_4382712.htm")!) {
                    Text("Book")
                }
                
            } header: {
                Text("Image Assets")
            }
            
            
            Section {
                Link(destination: URL(string: "https://github.com/notsobigcompany/BigUIPaging")!) {
                    Text("BigUIPaging by notsobigcompany (Card Deck code)")
                }
                
                Link(destination: URL(string: "https://github.com/apple/sample-food-truck")!) {
                    Text("WidthThresholdReader View of Food Truck sample code from WWDC 2022 by Apple")
                }
                
            } header: {
                Text("Code Credit")
            }
            
            Section {
                Text("Food Truck app by Apple from WWDC 2022")
            } header: {
                Text("App Inspiration")
            }
            
            Text("All the assets and code mentioned above are open-sourced by the respective owner.")
            
        }
        
    }
}

#Preview {
    AboutView()
}
