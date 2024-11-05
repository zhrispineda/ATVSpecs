//
//  ContentView.swift
//  ATVSpecs
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Storage", systemImage: "internaldrive") {
                StorageView()
            }
            
            Tab("Miscellaneous", systemImage: "memorychip") {
                MiscView()
            }
        }
    }
}

#Preview {
    ContentView()
}
