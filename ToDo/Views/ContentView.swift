

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView()
            .environmentObject(try! TaskViewModel())
    }
}
