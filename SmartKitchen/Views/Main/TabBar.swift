import SwiftUI

struct CustomTabBarItem: View {
    let systemImage: String
    let text: String

    var body: some View {
        VStack {
            Image(systemName: systemImage)
            Text(text)
        }
    }
}

struct TabBar: View {
    @State private var selectedTab = 1

    var body: some View {
        ZStack {
            // Background rectangle with opacity
            Rectangle()
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue) // Customize the background color as needed

            TabView(selection: $selectedTab) {
                SettingsView()
                    .tabItem {
                        CustomTabBarItem(systemImage: "gear", text: "Settings")
                    }
                    .tag(0)

                HomeView()
                    .tabItem {
                        CustomTabBarItem(systemImage: "house", text: "Home")
                    }
                    .tag(1)

                FavoritesView()
                    .tabItem {
                        CustomTabBarItem(systemImage: "calendar", text: "Planner")
                    }
                    .tag(2)
            }
        }
    }
}

struct TabBar_previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
