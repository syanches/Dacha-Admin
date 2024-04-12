//
//  Model.swift
//  Dacha Admin
//
//  Created by Artem Martirosyan on 27.09.2023.
//

import Foundation

class LockersSystem: Codable, ObservableObject {
    
    enum Sector: String, CaseIterable, Identifiable {
        case A,B,C,D,E,F
        
        var id: Self {
            self
        }
        
        var lockersCount: Int {
            switch self {
            case .A,.B,.C,.D:
                return 27
            case .E,.F:
                return 21
            }
        }
    }
    
    let A: [String: [String : String]]
    let B: [String: [String : String]]
    let C: [String: [String : String]]
    let D: [String: [String : String]]
    let E: [String: [String : String]]
    let F: [String: [String : String]]
    
    public static func loadLockers() -> LockersSystem? {
        if let jsonFileURL = Bundle.main.url(forResource: "api", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: jsonFileURL)
                let relayControl = try JSONDecoder().decode(LockersSystem.self, from: jsonData)
                return relayControl
            } catch {
                print("Ошибка декодирования JSON: \(error)")
            }
        }
        return nil
    }
    
    public func open(lockers: Locker...) {
        let lockersToOpen = lockers.map{$0.apiNumber}
        
        let url = "http://192.168.1.69/api/lockers/lockers/open/"
        let token = "token"
        
        let json: [String: Any] = ["lockers": lockersToOpen]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        if let url = URL(string: url ) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue( "Token \(token)", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    print("Response data: \(String(data: data, encoding: .utf8) ?? "")")
                }
            }
            task.resume()
        }
    }
}

public struct Locker {
    let sector: LockersSystem.Sector
    let number: Int
    
    var apiNumber: Int {
        switch sector {
        case .A:
            return 24 + number
        case .B:
            return 51 + number
        case .C:
            if number == 25 {
                return 151
            }
            if number == 26 {
                return 152
            }
            if number == 27 {
                return 153
            }
            return 0 + number
        case .D:
            if number == 25 {
                return 154
            }
            if number == 26 {
                return 155
            }
            if number == 27 {
                return 156
            }
            return 78 + number
        case .E:
            return 129 + number
        case .F:
            return 102 + number
        }
    }
}
