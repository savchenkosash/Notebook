//
//  NoteService.swift
//  Notebook
//
//  Created by Benji Loya on 11.03.2025.
//

import SwiftData
import Foundation

enum NoteFactory {
    static func createNoteService(context: ModelContext) -> NoteServiceProtocol {
        #if DEBUG
        print("🛠 Используется MockUserService (DEBUG)")
        return MockNoteService()
        #else
        print("🚀 Используется UserService (RELEASE)")
        return NoteService(context: context)
        #endif
    }
}

// MARK: - Protocol
protocol NoteServiceProtocol {
    func fetchCurrentNote() -> Note?
    func createNote(_ note: Note)
    func saveNote(_ note: Note)
    func updateNote(_ note: Note)
    func deleteNote(_ note: Note)
}

// MARK: - SWIFTDATA Service
final class NoteService: NoteServiceProtocol {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchCurrentNote() -> Note? {
        do {
            let notes = try context.fetch(FetchDescriptor<Note>())
            return notes.first
        } catch {
            print("⚠️ Ошибка при загрузке пользователя: \(error.localizedDescription)")
            return nil
        }
    }

    func saveNote(_ note: Note) {
        context.insert(note)
        do {
            try context.save()
            print("✅ Пользователь успешно сохранен.")
        } catch {
            print("⚠️ Ошибка при сохранении пользователя: \(error.localizedDescription)")
        }
    }

    func createNote(_ note: Note) {
     
    }
    
    func updateNote(_ note: Note) {
        do {
            if fetchCurrentNote() != nil {
                try context.save()
                print("✅ Пользователь успешно обновлен.")
            } else {
                print("⚠️ Пользователь не найден, создаем нового.")
                saveNote(note)
            }
        } catch {
            print("⚠️ Ошибка при обновлении пользователя: \(error.localizedDescription)")
        }
    }
    
    func deleteNote(_ note: Note) {
        context.delete(note)
        do {
            try context.save()
            print("✅ Пользователь успешно удален.")
        } catch {
            print("⚠️ Ошибка при удалении пользователя: \(error.localizedDescription)")
        }
    }
    
 
}


// MARK: - Mock User Service
final class MockNoteService: NoteServiceProtocol {
    private var mockNote: Note

    init() {
        self.mockNote = MockDataManager.shared.mockNote()
    }

    func fetchCurrentNote() -> Note? {
        return mockNote
    }

    func saveNote(_ note: Note) {
        self.mockNote = note
        print("✅ (Mock) Пользователь сохранен.")
    }
    
    func createNote(_ note: Note) {
     
    }
    
    func updateNote(_ note: Note) {
        self.mockNote = note
        print("✅ (Mock) Данные пользователя обновлены.")
    }
    
    func deleteNote(_ note: Note) {
        print("✅ (Mock) Пользователь удален.")
        self.mockNote = MockDataManager.shared.mockNote()
    }
}
