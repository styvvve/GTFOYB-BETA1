//
//  CardView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 07/04/2025.
//

import SwiftUI

struct CardView: View {
    
    let cellColor: Color = Color(UIColor(red: 20 / 255, green: 19 / 255, blue: 19 / 255, alpha: 1))
    
    //l'user
    let user: UserPreferences?
    
    //pour presenter les ecrans de payement premium ou de connexion
    @State private var presentSubView = false
    @State private var presentLogInView = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                Text(user?.name ?? "User")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
            }
            .onTapGesture {
                //va ramener l'utilisateur sur la page d'inscription
            }
            Divider()
            
            HStack {
                Text("Premium 🌟")
                    .font(.title2)
                    .padding(.horizontal)
                    .bold()
                Spacer()
                Button {
                    
                }label: {
                    HStack {
                        Text("Upgrade")
                            .foregroundStyle(.black)
                            .bold()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)
                    }
                    .padding(10)
                    .background(.white)
                    .clipShape(Capsule())
                }
            }
        }
        .padding(20)
        .background(cellColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 10)
        .fullScreenCover(isPresented: $presentLogInView) {
            //MARK: LA VUE ICI
        }
        .fullScreenCover(isPresented: $presentSubView) {
            //MARK: LA VUE ICI
        }
    }
}
#Preview {
    CardView(user: UserPreferences(name: "User1", darkMode: true))
}
