//
//  SwiftUIView.swift
//  Darb
//
//  Created by Shahad Alkhalaf on 13/05/1444 AH.
//

import SwiftUI


    struct SwiftUIView: View {
        var placeholder: String
        
        @Binding var text: String
      
        var body: some View {
            TextField(placeholder, text: $text)
            HStack {
                TextField(placeholder, text: $text)
                if text != "" {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.medium)
                        .foregroundColor(Color(.systemGray3))
                        .padding(3)
                        .onTapGesture {
                            withAnimation {
                                self.text = ""
                              }
                        }
                }
            }
            .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.vertical, 10)
        }
    }

