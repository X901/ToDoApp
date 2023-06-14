//
//  UpdateTaskView.swift
//  ToDo
//
//  Created by Basel Baragabah on 14/06/2023.
//

import SwiftUI

struct UpdateTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var taskViewModel: TaskViewModel
    @State private var taskName: String = ""
    var task: Task

    var body: some View {
        NavigationView {
            Form {
                TextField("Task Name", text: $taskName)
                
                Button("Update Task") {
                    taskViewModel.updateTask(taskName, task: task)
                    dismiss()
                }
            }
            .onAppear {
                taskName = task.name
            }
            .navigationBarTitle("Add New Task")
        }
    }
}

