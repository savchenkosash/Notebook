//
//  NotebookApp.swift
//  Notebook
//
//  Created by Benji Loya on 11.03.2025.
//

import SwiftUI
import SwiftData
import SwiftfulRouting

@main
struct NotebookApp: App {
    private let container = AppContainer() // ✅ Используем новый контейнер

    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
                    .environmentObject(container.noteViewModel)   // ✅ Передаем ViewModel юзера
                    .modelContainer(container.modelContainer)    // ✅ Передаем общий SwiftData контейнер
            }
        }
    }
}
