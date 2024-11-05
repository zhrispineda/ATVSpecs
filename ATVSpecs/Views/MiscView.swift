//
//  MiscView.swift
//  ATVSpecs
//

import SwiftUI

struct MiscView: View {
    // Variables
    let numberFormatter = NumberFormatter()
    let processInfo = ProcessInfo()
    @State private var coreCount = Int()
    @State private var hostName = String()
    @State private var operatingSystem = String()
    @State private var totalMemory = UInt64()
    @State private var uptime = TimeInterval()
    
    var body: some View {
        List {
            Section("Host") {
                VStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        Text("Name:")
                            .frame(width: 100, alignment: .leading)
                        Text("**\(hostName)**")
                    }
                    HStack(spacing: 0) {
                        Text("OS:")
                            .frame(width: 100, alignment: .leading)
                        Text("**\(operatingSystem)**")
                    }
                }
            }
            
            Section("Memory") {
                Text("Total memory estimate: **\(totalMemory) GB**")
            }
            
            Section("Processor") {
                Text("Core count: **\(coreCount)**")
                    .onAppear(perform: refreshData)
            }
            
            Section("Uptime") {
                VStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        Text("Seconds:")
                            .frame(width: 140, alignment: .leading)
                        Text("**\(String(format: "%.0f", uptime))**")
                    }
                    HStack(spacing: 0) {
                        Text("Minutes:")
                            .frame(width: 140, alignment: .leading)
                        Text("**\(String(format: "%.0f", uptime/60))**")
                    }
                    HStack(spacing: 0) {
                        Text("Hours:")
                            .frame(width: 140, alignment: .leading)
                        Text("**\(String(format: "%.2f", uptime/60/60))**")
                    }
                }
            }
            
            Section {
                Button("Refresh", action: refreshData)
            }
        }
    }
    
    // Functions
    func refreshData() {
        coreCount = processInfo.processorCount
        hostName = processInfo.hostName
        operatingSystem = processInfo.operatingSystemVersionString
        totalMemory = processInfo.physicalMemory / 1_000_000_000
        uptime = processInfo.systemUptime
    }
}

#Preview {
    MiscView()
}
