

import SwiftUI

struct TaskListView: View {
    @StateObject var taskViewModel = try! TaskViewModel()
    @State private var sheetState: SheetState? = nil
    @State private var currentTask: Task?

    enum SheetState: Identifiable {
        case add
        case update(Task)
        
        var id: String {
            switch self {
            case .add:
                return "add"
            case .update:
                return "update"
            }
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(taskViewModel.tasks.enumerated()), id: \.1.id) { index, task in
                    TaskRowView(taskViewModel: taskViewModel, task: task)
                        .onTapGesture {
                            sheetState = .update(task)
                        }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing:
                Button(action: { sheetState = .add }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(item: $sheetState) { item in
                switch item {
                case .add:
                    AddTaskView(taskViewModel: taskViewModel)
                case .update(let task):
                    UpdateTaskView(taskViewModel: taskViewModel, task: task)
                }
            }
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        offsets.map { taskViewModel.tasks[$0] }.forEach(taskViewModel.deleteTask)
    }
}
