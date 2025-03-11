//
//  MockDataManager.swift
//  Notebook
//
//  Created by Benji Loya on 11.03.2025.
//

import Foundation
import UIKit

final class MockDataManager {
    static let shared = MockDataManager()

    private init() {}

    func mockNote() -> Note {
           let image = UIImage(named: "nullProfile")?.jpegData(compressionQuality: 0.8)

        return Note(
            noteImage: image,
            title: "Benji Loya",
            subTitle: "benjiloya@gmail.com",
            isCompleted: false,
            dateCreate: Calendar.current.date(byAdding: .year, value: -30, to: Date()) ?? Date()
       )
    }
}
