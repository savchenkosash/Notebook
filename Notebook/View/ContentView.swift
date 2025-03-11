//
//  ContentView.swift
//  Notebook
//
//  Created by Benji Loya on 11.03.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var noteViewModel: NoteViewModel
    var body: some View {
        Home()
            .environmentObject(noteViewModel)
    }
}

#Preview {
    let container = AppContainer() // ✅ Создаем контейнер вручную для предпросмотра
    return ContentView()
        .environmentObject(container.noteViewModel)
}
