import SwiftUI

struct BreakfastView: View {
    @State private var api: API1?
    @State private var resultsx: [String] = []
    @State private var resultsx1: [String] = []
    @State private var searchText: String = ""
    @State private var showAlert = false // State variable to control the alert
    let selectedItemID: Int
    @State private var recipeDetails: API4?
    
    func fetchRecipeDetails() {
            // Construct the URL with selectedItemID
            let apiKey = "ad6054d5e93147fca5c0a1f473f3efa6"
            guard let apiURL = URL(string: "https://api.spoonacular.com/recipes/\(selectedItemID)/card?apiKey=\(apiKey)") else {
                return // Handle the case where the URL is invalid
            }
            
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: apiURL)
                    self.recipeDetails = try JSONDecoder().decode(API4.self, from: data)
                } catch {
                    print("Error fetching recipe details: \(error)")
                }
            }
        }
    
    var body: some View {
        List {
            ForEach(resultsx, id: \.self) { item in
                if let index = resultsx.firstIndex(of: item), index < resultsx1.count {
                    NavigationLink(destination: RecipeDetails(selectedItemID: Int(resultsx1[index]) ?? 0)) {
                        Text(item)
                    }
                }
            }
        }
        .onAppear{
            fetchRecipeDetails()
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
        // Replace with your actual API key, and consider a more secure storage option
        let apiKey = "ad6054d5e93147fca5c0a1f473f3efa6"
        guard let searchQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let apiURL = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&query=\(searchQuery)")else {
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
                
            } catch {
                print("Error: \(error)")
                showAlert = true // Display the alert for API request errors
            }
            

            
        }
    }
    
    
    
}

struct BreakfastView_Previews: PreviewProvider {
    static var previews: some View {
        BreakfastView(selectedItemID: 123)
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
    var url: String
}
