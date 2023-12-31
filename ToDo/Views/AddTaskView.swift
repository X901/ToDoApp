

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var taskViewModel: TaskViewModel
    @State private var taskName: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Task Name", text: $taskName)
                Button("Add Task") {
                    taskViewModel.addTask(taskName)
                    dismiss()
                }
            }
            .navigationBarTitle("Add New Task")
        }
    }
}
