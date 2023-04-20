//
//  RatingView.swift
//  NihilentAssignment
//
//  Created by Narendra Satpute on 17/04/23.
//

import SwiftUI

struct RatingView: View {
    struct ClipShape: Shape {
        let width: Double
        
        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
        }
    }
    
    @Binding private var rating: Double
    private let maxRating: Int
    
    init(rating: Binding<Double>, maxRating: Int) {
        self.maxRating = maxRating
        self._rating = rating
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Text(Image(systemName: "star"))
                    .foregroundColor(.blue)
                    .aspectRatio(contentMode: .fill)
            }
        }.overlay(
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.blue)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .clipShape(
                    ClipShape(width: (reader.size.width / CGFloat(maxRating)) * CGFloat(rating))
                )
            }
        )
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(1.6), maxRating: 5)
    }
}

