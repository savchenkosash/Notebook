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
  //  let editingService: NoteEditingServiceProtocol
    let noteViewModel: NoteViewModel
  //  let editNoteViewModel: EditNoteViewModel

    init() {
        do {
            // ✅ Используем ОДИН ModelContainer для всех моделей
            modelContainer = try ModelContainer(for: Note.self)
            modelContext = ModelContext(modelContainer)
            
            // ✅ Выбираем сервисы в зависимости от типа сборки
            noteService = NoteFactory.createNoteService(context: modelContext)
       //     editingService = NoteEditingService(noteService: noteService)
            
            // ✅ Создаем ViewModel
            noteViewModel = NoteViewModel(noteService: noteService)
       //     editUserViewModel = EditUserViewModel(userService: userService, editingService: editingService)
            
        } catch {
            fatalError("❌ Ошибка инициализации AppContainer: \(error.localizedDescription)")
        }
    }
}
