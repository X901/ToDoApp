

import SwiftUI

struct TaskListView: View {
    @StateObject var taskViewModel = try! TaskViewModel()
    @State private var showingAddTaskView: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(taskViewModel.tasks.enumerated()), id: \.1.id) { index, task in
                    TaskRowView(task: task)
                }
                .onDelete(perform: deleteTask)
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing:
                Button(action: { showingAddTaskView.toggle() }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddTaskView) {
                AddTaskView()
            }
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        offsets.map { taskViewModel.tasks[$0] }.forEach(taskViewModel.deleteTask)
    }
}
