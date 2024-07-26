//
//  MealDetailView.swift
//  MealMagic
//
//  Created by Shashank Sacheti on 7/25/24.
//

//
//  MealDetailView.swift
//  MealMagic
//
//  Created by Shashank Sacheti on 7/25/24.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @StateObject private var viewModel = MealDetailViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            if let mealDetail = viewModel.mealDetail {
                Text(mealDetail.strMeal)
                    .font(.largeTitle)
                    .padding()

                if let imageUrl = mealDetail.strMealThumb, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: .infinity)
                             .padding()
                    } placeholder: {
                        ProgressView()
                    }
                }

                Text("Ingredients:")
                    .font(.headline)
                    .padding([.leading, .top])

                VStack(alignment: .leading) {
                    // Created arrays of ingredients and measurements
                    let ingredients = [
                        mealDetail.strIngredient1, mealDetail.strIngredient2, mealDetail.strIngredient3, mealDetail.strIngredient4,
                        mealDetail.strIngredient5, mealDetail.strIngredient6, mealDetail.strIngredient7, mealDetail.strIngredient8,
                        mealDetail.strIngredient9, mealDetail.strIngredient10, mealDetail.strIngredient11, mealDetail.strIngredient12,
                        mealDetail.strIngredient13, mealDetail.strIngredient14, mealDetail.strIngredient15, mealDetail.strIngredient16,
                        mealDetail.strIngredient17, mealDetail.strIngredient18, mealDetail.strIngredient19, mealDetail.strIngredient20
                    ]

                    let measurements = [
                        mealDetail.strMeasure1, mealDetail.strMeasure2, mealDetail.strMeasure3, mealDetail.strMeasure4,
                        mealDetail.strMeasure5, mealDetail.strMeasure6, mealDetail.strMeasure7, mealDetail.strMeasure8,
                        mealDetail.strMeasure9, mealDetail.strMeasure10, mealDetail.strMeasure11, mealDetail.strMeasure12,
                        mealDetail.strMeasure13, mealDetail.strMeasure14, mealDetail.strMeasure15, mealDetail.strMeasure16,
                        mealDetail.strMeasure17, mealDetail.strMeasure18, mealDetail.strMeasure19, mealDetail.strMeasure20
                    ]

                    ForEach(0..<20, id: \.self) { index in
                        if let ingredient = ingredients[index], !ingredient.isEmpty {
                            Text("\(ingredient) - \(measurements[index] ?? "")")
                        }
                    }
                }
                .padding(.leading)

                Text("Instructions:")
                    .font(.headline)
                    .padding([.leading, .top])

                Text(mealDetail.strInstructions)
                    .padding([.leading, .trailing, .bottom])
            } else {
                ProgressView()
                    .onAppear {
                        Task {
                            await viewModel.fetchMealDetails(mealID: mealID)
                        }
                    }
            }
        }
        .navigationTitle("Meal Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealID: "52772")
    }
}
