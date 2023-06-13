

import Foundation
import RealmSwift

enum MyError: Error {
    case errorFetchingTasks
}

class RealmManager {
    static let shared = RealmManager()
    private var realm: Realm?

    private init() {
        do {
            realm = try Realm()
        } catch let error {
            // Here you might want to handle the error in a way that's appropriate for your app.
            print("Failed to initialize Realm: \(error.localizedDescription)")
        }
    }

    func addObject<T: Object>(_ object: T) {
        do {
            try realm?.write {
                realm?.add(object)
            }
        } catch let error {
            print("Failed to add object: \(error.localizedDescription)")
        }
    }

    func deleteObject<T: Object>(_ object: T) {
        do {
            try realm?.write {
                realm?.delete(object)
            }
        } catch let error {
            print("Failed to delete object: \(error.localizedDescription)")
        }
    }

    func updateObject(_ closure: () -> Void) {
        do {
            try realm?.write {
                closure()
            }
        } catch let error {
            print("Failed to update object: \(error.localizedDescription)")
        }
    }

    func fetchObjects<T: Object>(_ objectType: T.Type) -> Results<T>? {
        if let realm = realm {
            return realm.objects(objectType)
        } else {
            print("Realm is not initialized")
            return nil
        }
    }
}
