

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId // This is our primary key, and each Task instance can be uniquely identified by the ID
    @Persisted var name = ""
    @Persisted var isCompleted = false
}
