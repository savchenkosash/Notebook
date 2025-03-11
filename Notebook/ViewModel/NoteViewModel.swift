//
//  NoteViewModel.swift
//  Notebook
//
//  Created by Benji Loya on 11.03.2025.
//

import SwiftData
import Foundation

class NoteViewModel: ObservableObject {
    @Published var note: Note?
    private let noteService: NoteServiceProtocol

    var service: NoteServiceProtocol { noteService }
    
    init(noteService: NoteServiceProtocol) {
        self.noteService = noteService
        loadNote()
    }

    // 🔍 Загрузка текущего пользователя
    func loadNote() {
        self.note = noteService.fetchCurrentNote()
    }
    
    // 💾 Сохранение нового пользователя
    func saveUser() {
        guard let note = note else { return }
        noteService.saveNote(note)
        print("✅ Новый пользователь сохранен.")
    }
    
    // ✏️ Обновление данных существующего пользователя
    func updateNote() {
        guard let note = note else { return }
        noteService.updateNote(note)
        print("✅ Данные пользователя обновлены.")
    }
    
    // 🗑 Удаление пользователя
    func deleteNote() {
        guard let note = note else { return }
        noteService.deleteNote(note)
        self.note = nil
        print("✅ Пользователь удален.")
    }

}
