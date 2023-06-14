

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var taskViewModel: TaskViewModel
    var task: Task

    var body: some View {
        HStack {
            if !task.isInvalidated {
                Text(task.name)
                Spacer()
                Button(action: { taskViewModel.toggleTaskCompletion(task) }) {
                    Image(systemName: task.isCompleted ? "checkmark.square": "square")
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}
