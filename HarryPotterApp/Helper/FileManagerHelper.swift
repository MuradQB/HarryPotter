//
//  FileManagerHelper.swift
//  HarryPotterApp
//
//  Created by Murad Qarayev on 06.01.25.
//

import Foundation
class FileManagerHelper {
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("Basket.json")
        return path
    }
    
    func readData(completion: (([ProductModel]) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let product = try JSONDecoder().decode([ProductModel].self, from: data)
                completion(product)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func writeData(product: [ProductModel]) {
        do {
            let data = try JSONEncoder().encode(product)
            let path = getFilePath()
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
}
