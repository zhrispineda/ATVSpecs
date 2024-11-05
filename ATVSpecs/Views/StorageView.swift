//
//  StorageView.swift
//  ATVSpecs
//

import SwiftUI

struct StorageView: View {
    // Variables
    let helper = Helper()
    @State private var freeSpace = "Loading..."
    @State private var totalSpace = "Loading..."
    @State private var convertedTotalSpace = CGFloat()
    @State private var usedSpace = CGFloat()
    
    var body: some View {
        VStack(spacing: 50) {
            ZStack {
                Circle() // Background ring
                    .stroke(style: StrokeStyle(lineWidth: 16.0))
                    .opacity(0.9)
                    .foregroundColor(Color.red)
                VStack {
                    Text("\(String(format: "%.2f", usedSpace)) of \(totalSpace) used")
                    Text("\(freeSpace) free")
                        .foregroundStyle(.secondary)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .fontWidth(.condensed)
                .onAppear(perform: refreshData)
                Circle() // Ring
                    .trim(from: (usedSpace) / convertedTotalSpace, to: 1.0)
                    .stroke(style: StrokeStyle(lineWidth: 16.0))
                    .rotationEffect(.degrees(270))
                    .foregroundStyle(Color.gray)
            }
            .padding(.vertical, 50)
            
            Button("Refresh", action: refreshData)
        }
    }
    
    // Functions
    func refreshData() {
        freeSpace = helper.getAvailableStorage()
        totalSpace = helper.getTotalStorage()
        usedSpace = helper.getUsedStorage()
        convertedTotalSpace = helper.convertStringToFloat(totalSpace)
    }
}

#Preview {
    StorageView()
}
