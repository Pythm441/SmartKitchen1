import SwiftUI

struct BreakfastView: View {
    @State private var api: API1?
    @State private var api2: [API2] = []
    @State private var api3: API3?
    @State private var api4: [API4] = []
    @State private var resultsx: [String] = []
    @State private var resultsx1: [String] = []
    @State private var searchText: String = ""
    @State private var showAlert = false // State variable to control the alert
    
    var body: some View {
        List {
            ForEach(resultsx, id: \.self) { item in
                NavigationLink(destination: RecipeDetails(selectedItemID: Int(resultsx1[resultsx.firstIndex(of: item)!]) ?? 0)) {
                    Text(item)
                }
            }
        }
        .listStyle(.plain)
        .searchable(text: $searchText)
        .onChange(of: searchText) { value in
            if !value.isEmpty && value.count > 3 {
                performAPISearch(query: value)
            } else {
                resultsx.removeAll()
            }
        }
        .navigationTitle("Breakfast")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Invalid URL"),
                message: Text("The URL for the API request is invalid. Please try again."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    private func performAPISearch(query: String) {
        // Replace with your actual API key
        let apiKey = "3dcc7436a1dd43e1a71b267740fafacc"
        guard let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let apiURL = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&query=\(searchQuery)") else {
            showAlert = true // Display the alert
            return // Exit the function
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: apiURL)
                self.api = try JSONDecoder().decode(API1.self, from: data)
                
                if let results1 = api?.results {
                    resultsx = results1.map { $0.title }
                    resultsx1 = results1.map { String($0.id) }
                } else {
                    print("The array is empty or nil.")
                }
                
                self.api2 = try JSONDecoder().decode([API2].self, from: data)
                self.api3 = try JSONDecoder().decode(API3.self, from: data)
                self.api4 = try JSONDecoder().decode([API4].self, from: data)
                
                print("---------------------")
                print(api4)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
struct BreakfastView_Previews: PreviewProvider {
    static var previews: some View {
        BreakfastView()
    }
}

struct API1: Codable {
    var results: [API2]
    var offset: Int
    var number: Int
    var totalResults: Int
}

struct API2: Hashable, Codable {
    var id: Int
    var title: String
    var image: URL
    var imageType: String
}

struct API3: Codable {
    var results: [API4]
    var offset: Int
    var number: Int
    var totalResults: Int
}

struct API4: Hashable, Codable {
    var id: Int
    var title: String
}
