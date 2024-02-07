//
//  HomeView.swift
//  BankAppWorkWithGradientAndTestingEnvironmentObject
//
//  Created by Макс Лахман on 08.02.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            header(userImage: "3dPerson", userName: "Name", userLastName: "LastName")
            Spacer()
        }
        
        
    }
    
    private func header(userImage: String?, userName: String, userLastName: String) -> some View {
        HStack{
            if let imageName = userImage, let image = UIImage(named: imageName) {
                Image(uiImage: image)
                    .resizable()                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.black)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.black)
                    .background(Color("LightPurpule"))
            }
            HStack {
                Text(userName)
                Text( userLastName + "👏")
            }
            Spacer()
            // якщо треба з opacity
//            ZStack {
//                Image(systemName: "bell")
//                    .background{
//                        Circle().frame(width: 7).position(CGPoint(x: 13.0, y: 3.0)).foregroundColor(Color("DarkPurpule"))
//                    }
//            }
            // no opacity
            ZStack {
                Image(systemName: "bell")
                    .overlay {
                        Circle().foregroundColor(Color("DarkPurpule")).frame(width: 7, height: 7).position(CGPoint(x: 13.0, y: 3))
                    }
            }
            
        }.padding(.horizontal, 20)
    }
}

#Preview {
    HomeView()
}
