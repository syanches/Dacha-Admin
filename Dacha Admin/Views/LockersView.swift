//
//  LockersView.swift
//  Dacha Admin
//
//  Created by Artem Martirosyan on 26.09.2023.
//

import SwiftUI

struct LockersView: View {
    @State var sectorSelect: LockersSystem.Sector = .A
    @State var numberSelect: Int = 1
    @EnvironmentObject var lockersSystem: LockersSystem
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack {
                    Text("Сектор")
                        .font(.system(size: 30))
                        .foregroundStyle(.purple)
                    Picker("Сектор", selection: $sectorSelect) {
                        ForEach(LockersSystem.Sector.allCases) { sector in
                            Text(sector.rawValue)
                                .font(.system(size: 40, weight: .heavy, design: .rounded))
                                .foregroundStyle(.purple)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                VStack {
                    Text("Шкафчик")
                        .font(.system(size: 30))
                        .foregroundStyle(.purple)
                    Picker("Шкафчик", selection: $numberSelect) {
                        ForEach(1..<sectorSelect.lockersCount + 1, id: \.self) { locker in
                            Text("\(locker)")
                                .font(.system(size: 40, weight: .heavy, design: .rounded))
                                .foregroundStyle(.purple)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                }
            }
            Button(action: {lockersSystem.open(lockers: Locker(sector: sectorSelect, number: numberSelect))
            }) { Group {
                Image(systemName: "lock.open")
                Text("/")
                Image(systemName: "lock")
            }
            .font(.system(size: 20))
            .padding(5)
            }
            .buttonBorderShape(.roundedRectangle)
            .buttonStyle(.borderedProminent)
            .tint(Color.purple)
            .padding()
        }
        .onChange(of: sectorSelect) {
            numberSelect = 1
        }
    }
}

#Preview {
    LockersView()
}
