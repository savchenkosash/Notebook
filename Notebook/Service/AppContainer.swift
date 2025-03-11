//
//  AppContainer.swift
//  Notebook
//
//  Created by Benji Loya on 11.03.2025.
//

import SwiftData
import Foundation

final class AppContainer {
    let modelContainer: ModelContainer
    let modelContext: ModelContext
    let noteService: NoteServiceProtocol
    let noteViewModel: NoteViewModel

    init() {
        do {
            // ✅ Используем ОДИН ModelContainer для всех моделей
            modelContainer = try ModelContainer(for: Note.self)
            modelContext = ModelContext(modelContainer)
            
            // ✅ Выбираем сервисы в зависимости от типа сборки
            noteService = NoteFactory.createNoteService(context: modelContext)
            
            // ✅ Создаем ViewModel
            noteViewModel = NoteViewModel(noteService: noteService)
            
        } catch {
            fatalError("❌ Ошибка инициализации AppContainer: \(error.localizedDescription)")
        }
    }
}
