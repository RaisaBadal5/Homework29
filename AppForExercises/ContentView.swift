import SwiftUI

struct ContentView: View {
    @State private var incompleteTaskCount: Int = 4
    @State private var tasks = [
        TaskModel(id: UUID(), title: "დავივიწყო იუაიკიტი", date: "May 24, 2024", isCompleted: false),
        TaskModel(id: UUID(), title: "გადავერთო სვიფტიუაიზე", date: "May 25, 2024", isCompleted: false),
        TaskModel(id: UUID(), title: "მოვუსმინო ტეილორს", date: "May 26, 2024", isCompleted: false),
        TaskModel(id: UUID(), title: "გიალოს სიმღერები ჩავიწერო ტელეფონში", date: "May 27, 2024", isCompleted: false),
        TaskModel(id: UUID(), title: "ლელა წურწუმიას მოვუსმინო", date: "May 28, 2024", isCompleted: false),
        TaskModel(id: UUID(), title: "ხატია წერეთელს მოვუსმინო", date: "May 29, 2024", isCompleted: false)
    ]
    
    var body: some View {
        VStack {
            ViewForHeader(textForTask: $incompleteTaskCount, completeAllTasks: {
                completeAllTasks()
            })
            .padding(.top,70)
            
            Text("Progress")
                .padding(.top)
                .font(.headline)
                .bold()
            
            ViewForProgressBar(completedTasks: tasks.filter { $0.isCompleted }.count, totalTasks: tasks.count)
                .padding(.top)
            
            Text("Completed Tasks")
                .padding(.top)
                .font(.headline)
                .bold()
            
            ViewForTaskList(tasks: $tasks, incompleteTaskCount: $incompleteTaskCount)
        }
    }
    
    //MARK: - completeAllTasks
    func completeAllTasks() {
        tasks = tasks.map { TaskModel(id: $0.id, title: $0.title, date: $0.date, isCompleted: true) }
        incompleteTaskCount = tasks.filter { !$0.isCompleted }.count
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)             .previewLayout(.sizeThatFits)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
