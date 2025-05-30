//
//  StorageView.swift
//  ATVSpecs
//

import SwiftUI

struct StorageView: View {
    let helper = Helper()
    @State private var freeSpace = "Loading..."
    @State private var totalSpace = "Loading..."
    @State private var convertedTotalSpace = CGFloat()
    @State private var usedSpace = CGFloat()
    
    var body: some View {
        VStack(spacing: 50) {
            ZStack {
                // Background ring
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 16.0))
                    .foregroundColor(Color.blue)
                VStack {
                    Text("\(String(format: "%.2f", usedSpace)) of \(totalSpace) used")
                    Text("\(freeSpace) free")
                        .foregroundStyle(.secondary)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .fontWidth(.condensed)
                
                // Ring
                Circle()
                    .trim(from: (usedSpace) / convertedTotalSpace, to: 1.0)
                    .stroke(style: StrokeStyle(lineWidth: 16.0))
                    .rotationEffect(.degrees(270))
                    .foregroundStyle(Color.gray)
            }
            .padding(.vertical, 50)
            
            Button("Refresh", action: refreshData)
        }
        .onAppear(perform: refreshData)
    }
    
    // MARK: Functions
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
