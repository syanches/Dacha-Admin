//
//  ContentView.swift
//  Dacha Admin
//
//  Created by Artem Martirosyan on 26.09.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
        TabView {
            Group {
                LockersView()
                    .tabItem {
                        Label("Локеры", systemImage: "cabinet")
                    }
                BraceletsView()
                    .tabItem {
                        Label("Браслеты", systemImage: "printer")
                    }
                ScheduleView()
                    .tabItem {
                        Label("Расписание", systemImage: "calendar")
                    }
                ServicesView()
                    .tabItem {
                        Label("Сервисы", systemImage: "wrench.and.screwdriver.fill")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

#Preview {
    MainView()
}
