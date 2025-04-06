//
//  RestorePremiumPurchasesCard.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 07/04/2025.
//

import SwiftUI

struct RestorePremiumPurchasesCard: View {
    let cellColor: Color = Color(UIColor(red: 20 / 255, green: 19 / 255, blue: 19 / 255, alpha: 1))
        
        @State private var isRequestToRestore = false
        
        var body: some View {
            VStack {
                Button {
                    isRequestToRestore.toggle()
                }label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Restore premium purchases")
                        Spacer()
                    }
                }
            }
            .padding(20)
            .background(cellColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 10)
        }
    }

#Preview {
    RestorePremiumPurchasesCard()
}
