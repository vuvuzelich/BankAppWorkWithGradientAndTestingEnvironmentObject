//
//  MainView.swift
//  BankAppWorkWithGradientAndTestingEnvironmentObject
//
//  Created by Макс Лахман on 08.02.2024.
//

enum Tabs {
    case home
    case settings
}

import SwiftUI

struct TabBarView: View {
    @State private var currentTab : Tabs = .home
    var body: some View {
        ZStack{
            TabView(selection: $currentTab){
                Group{
                    NavigationStack{
                        HomeView()
                    }
                    .tag(Tabs.home)
                    NavigationStack{
                        SettingsView()
                    }
                    .tag(Tabs.settings)
                }.toolbar(.hidden, for: .tabBar)
            }
            VStack{
                Spacer()
                tabBar
            }
        }
    }
    
    private var tabBar : some View {
        HStack{
            Spacer()
            Button{
                withAnimation(.easeInOut) {
                    currentTab = .home
                }
            } label: {
                VStack {
                    Image(systemName: "homekit").resizable().scaledToFit().frame(width: 22)
                    if currentTab == .home {
                        Text("Home").font(.system(size: 11))
                    }
                }
            }            .foregroundStyle(currentTab == .home ? Color.primary : Color.secondary)
            Spacer()
            Button{
                withAnimation(.easeInOut) {
                    currentTab = .settings
                }
            } label: {
                VStack {
                    Image(systemName: "gearshape").resizable().scaledToFit().frame(width: 22)
                    
                    if currentTab == .settings {
                        Text("Setting").font(.system(size: 11))
                    }
                }
            }
            .foregroundStyle(currentTab == .settings ? Color.primary : Color.secondary)
            Spacer()
            
        }
        .frame(height: 72)
        .background{
            RoundedRectangle(cornerRadius: 35)
                .fill(RadialGradient(gradient: Gradient(colors: [Color("DarkPurpule"), .white]), center: .center, startRadius: 2, endRadius: 350))
                .shadow(color: .black.opacity(0.5), radius: 8, y: 2)
        }
        .padding(.horizontal, 10)
    }
}


#Preview {
    TabBarView()
}
