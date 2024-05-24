//
//  ViewForHeader.swift
//  AppForExercises
//
//  Created by Default on 24.05.24.
//

import SwiftUI

struct ViewForHeader: View {
    @Binding var textForTask: Int
    var completeAllTasks: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("You have \(textForTask) tasks to complete")
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                    .padding(14)
                Spacer()
                ZStack {
                    Image("Image1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 45)
                        .padding(14)
                    
                    if textForTask > 0 {
                        Text("\(textForTask)")
                            .font(.system(size: 14))
                            .padding(6)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .offset(x: 20, y: -20)
                    }
                }
            }
            
            Button(action: {
                completeAllTasks()
            }) {
                Text("Complete All")
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(8)
            }
        }
    }
}

struct ViewForHeader_Previews: PreviewProvider {
    @State static var previewTextForTask = 4

    static var previews: some View {
        ViewForHeader(textForTask: $previewTextForTask, completeAllTasks: {})
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
        ViewForHeader(textForTask: $previewTextForTask, completeAllTasks: {})
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
