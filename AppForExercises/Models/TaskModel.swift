//
//  TaskModel.swift
//  AppForExercises
//
//  Created by Default on 24.05.24.
//

import Foundation

struct TaskModel: Identifiable {
    var id: UUID
    var title: String
    var date: String
    var isCompleted: Bool
}

