//
//  Scheduler.swift
//  SmartKitchen
//
//  Created by Abdelrahman Hesham on 14/11/2023.
//

import SwiftUI

struct Taskie: Identifiable, Codable {
    var id = UUID()
    var name: String
    var dueDate: Date
    var isCompleted = false
}

class TaskManager: ObservableObject {
    @Published var tasks: [Taskie] {
        didSet {
            saveTasks()
        }
    }

    init() {
        self.tasks = TaskManager.loadTasks()
    }

    func addTask(name: String, dueDate: Date) {
        let newTask = Taskie(name: name, dueDate: dueDate)
        tasks.append(newTask)
    }

    func completeTask(task: Taskie) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted = true
        }
    }

    func removeTask(task: Taskie) {
        tasks.removeAll { $0.id == task.id }
    }

    private func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: "tasks")
        }
    }

    private static func loadTasks() -> [Taskie] {
        if let savedTasksData = UserDefaults.standard.data(forKey: "tasks"),
           let savedTasks = try? JSONDecoder().decode([Taskie].self, from: savedTasksData) {
            return savedTasks
        }
        return []
    }
}

struct TaskFormView: View {
    @State private var taskName = ""
    @State private var dueDate = Date()

    @ObservedObject var taskManager: TaskManager
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Task Name", text: $taskName)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }

                Section {
                    Button("Add Task") {
                        taskManager.addTask(name: taskName, dueDate: dueDate)
                        taskName = ""
                        isPresented.toggle()
                    }
                }
            }
            .navigationTitle("New Task")
        }
    }
}

struct TaskListView: View {
    @ObservedObject var taskManager: TaskManager
    @State private var isFormPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(taskManager.tasks) { taskie in
                    NavigationLink(destination: TaskieDetailView(taskManager: taskManager, taskie: taskie)) {
                        HStack {
                            Text(taskie.name)
                            Spacer()
                            if taskie.isCompleted {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    let taskiesToDelete = indexSet.map { taskManager.tasks[$0] }
                    for taskie in taskiesToDelete {
                        taskManager.removeTask(task: taskie)
                    }
                }
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing: EditButton())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isFormPresented.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isFormPresented) {
                TaskFormView(taskManager: taskManager, isPresented: $isFormPresented)
            }
        }
    }
}

struct TaskieDetailView: View {
    @ObservedObject var taskManager: TaskManager
    var taskie: Taskie

    var body: some View {
        VStack {
            Text(taskie.name)
                .font(.title)
            Text("Due Date: \(formattedDate())")

            Spacer()

            Button("Complete Task") {
                taskManager.completeTask(task: taskie)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Task Detail")
    }

    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: taskie.dueDate)
    }
}

struct Scheduler: View {
    @StateObject var taskManager = TaskManager()

    var body: some View {
        TabView {
            TaskListView(taskManager: taskManager)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tasks")
                }
        }
    }
}

struct Scheduler_Previews: PreviewProvider {
    static var previews: some View {
        Scheduler()
    }
}

