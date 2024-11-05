//
//  Helper.swift
//  ATVSpecs
//

import Foundation

class Helper {
    func getAvailableStorage() -> String {
        let fileManager = FileManager.default
        do {
            let systemAttributes = try fileManager.attributesOfFileSystem(forPath: NSHomeDirectory())
            if let freeSize = systemAttributes[.systemFreeSize] as? NSNumber {
                let bytes = freeSize.int64Value
                let formatter = ByteCountFormatter()
                formatter.allowedUnits = [.useGB]
                formatter.countStyle = .file
                return formatter.string(fromByteCount: bytes)
            }
        } catch {
            print("Error retrieving available storage: \(error.localizedDescription)")
        }
        return "Error"
    }
    
    func getUsedStorage() -> CGFloat {
        let availableStorage = convertStringToFloat(getAvailableStorage())
        let totalStorage = convertStringToFloat(getTotalStorage())
        let usedStorage = CGFloat(totalStorage) - CGFloat(availableStorage)
        
        return usedStorage
    }
    
    func getTotalStorage() -> String {
        let fileManager = FileManager.default
        do {
            let systemAttributes = try fileManager.attributesOfFileSystem(forPath: NSHomeDirectory())
            if let freeSize = systemAttributes[.systemSize] as? NSNumber {
                let bytes = freeSize.int64Value
                let formatter = ByteCountFormatter()
                formatter.allowedUnits = [.useGB]
                formatter.countStyle = .file
                return formatter.string(fromByteCount: bytes)
            }
        } catch {
            print("Error retrieving capacity storage: \(error.localizedDescription)")
        }
        return "Error"
    }
    
    func convertStringToFloat(_ string: String) -> CGFloat {
        var convertedValue = CGFloat()
        let filteredString = string.filter { "0123456789.".contains($0) }

        if let doubleValue = Double(filteredString) {
            convertedValue = CGFloat(doubleValue)
        }
        
        return convertedValue
    }
}
