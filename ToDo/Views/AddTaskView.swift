

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State private var taskName: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Task Name", text: $taskName)
                Button("Add Task") {
                    taskViewModel.addTask(taskName)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Add New Task")
        }
    }
}
