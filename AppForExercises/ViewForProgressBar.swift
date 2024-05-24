//
//  ViewForProgressBar.swift
//  AppForExercises
//
//  Created by Default on 24.05.24.
//

import SwiftUI

struct ViewForProgressBar: View {
    var completedTasks: Int
    var totalTasks: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Daily Task")
                .bold()
                .font(.headline)
     
            Text("\(completedTasks)/\(totalTasks) Tasks completed")
                .font(.subheadline)

            HStack {
                Text("Keep working")
                    .font(.footnote)
                
                Spacer()
                
                Text("\(Int(Double(completedTasks) / Double(totalTasks) * 100))%")
                    .font(.footnote)

            }
            ProgressView(value: Double(completedTasks) / Double(totalTasks))
                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                .frame(height: 20)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
        .padding()
    }
}

struct ViewForProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ViewForProgressBar(completedTasks: 3, totalTasks: 6)
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
        ViewForProgressBar(completedTasks: 3, totalTasks: 6)
            .preferredColorScheme(.dark) 
            .previewLayout(.sizeThatFits)
    }
}
