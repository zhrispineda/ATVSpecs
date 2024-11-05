//
//  ContentView.swift
//  ATVSpecs
//

import SwiftUI

struct ContentView: View {
    // Variables
    let processInfo = ProcessInfo()
    let formatter = ByteCountFormatter()
    
    var body: some View {
        TabView {
            Tab("Storage", systemImage: "internaldrive") {
                StorageView()
            }
            
            Tab("Memory", systemImage: "memorychip") {
                EmptyView()
            }
            
            Tab("Miscellaneous", systemImage: "appletv") {
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
