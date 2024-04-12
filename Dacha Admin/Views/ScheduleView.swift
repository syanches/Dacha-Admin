//
//  ScheduleView.swift
//  Dacha Admin
//
//  Created by Artem Martirosyan on 26.09.2023.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
//        Link("Здесь будет расписание тренировок, пока так", destination: URL(string: "https://plus.yandex.ru/dacha")!)
        WebView(url: URL(string: "https://plus.yandex.ru/dacha")!)
    }
}

#Preview {
    ScheduleView()
}
