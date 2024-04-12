//
//  ServicesView.swift
//  Dacha Admin
//
//  Created by Artem Martirosyan on 26.09.2023.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        VStack {
            Button(action: {turnOnBluetooth()}, label: {
                Text("Включить Bluetooth")
                    .padding(10)
            })
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
    }
    
    func turnOnBluetooth() {
        print("on")
    }
}

#Preview {
    ServicesView()
}
