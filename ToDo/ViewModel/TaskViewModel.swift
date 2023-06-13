

import SwiftUI
import RealmSwift

class TaskViewModel: ObservableObject {
    private var token: NotificationToken?
    @Published var tasks: Results<Task>
    
    

    init() throws {
        guard let task = RealmManager.shared.fetchObjects(Task.self) else {throw MyError.errorFetchingTasks}
        tasks = task

        // Observe Results Notifications
        token = tasks.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                self?.objectWillChange.send()
            case .update(_, _, _, _):
                self?.objectWillChange.send()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }

    deinit {
        // Always invalidate your notification tokens when you are done.
        token?.invalidate()
    }
    
    func addTask(_ name: String) {
        let task = Task()
        task.name = name
        RealmManager.shared.addObject(task)
    }
    
    func deleteTask(_ task: Task) {
        RealmManager.shared.deleteObject(task)
    }
    
    func toggleTaskCompletion(_ task: Task) {
        RealmManager.shared.updateObject {
            task.isCompleted.toggle()
        }
    }
}
