//
//  ViewForTaskList.swift
//  AppForExercises
//
//  Created by Default on 24.05.24.
//

import SwiftUI

struct ViewForTaskList: View {
    @Binding var tasks: [TaskModel]
    @Binding var incompleteTaskCount: Int
    
    var body: some View {
        VStack {
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    TaskRow(task: tasks[index]) { toggledTask in
                        toggleTaskCompletion(task: toggledTask)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .onAppear {
                updateIncompleteTaskCount()
            }
        }
    }
    
    func toggleTaskCompletion(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            if tasks[index].isCompleted {
                tasks.insert(tasks.remove(at: index), at: 0)
            } else {
                tasks.append(tasks.remove(at: index))
            }
            updateIncompleteTaskCount()
        }
    }
    
    func updateIncompleteTaskCount() {
        incompleteTaskCount = tasks.filter { !$0.isCompleted }.count
    }
    
    struct TaskRow: View {
        var task: TaskModel
        var toggleCompletion: (TaskModel) -> Void
        
        var body: some View {
            Button(action: {
                toggleCompletion(task)
            }) {
                HStack {
                    Text(task.title)
                    Spacer()
                    Text(task.date)
                    if task.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
                    }
                }
                .contentShape(Rectangle())
                .padding()
                .background(task.isCompleted ? Color(.systemGray6) : Color.white)
                .cornerRadius(8)
            }
        }
    }
}

struct ViewForTaskList_Previews: PreviewProvider {
    @State static var previewTasks = [
        TaskModel(id: UUID(), title: "Task 1", date: "May 24, 2024", isCompleted: false),
        TaskModel(id: UUID(), title: "Task 2", date: "May 25, 2024", isCompleted: false)
    ]
    @State static var previewIncompleteTaskCount = 2

    static var previews: some View {
        ViewForTaskList(tasks: $previewTasks, incompleteTaskCount: $previewIncompleteTaskCount)
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
        ViewForTaskList(tasks: $previewTasks, incompleteTaskCount: $previewIncompleteTaskCount)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
