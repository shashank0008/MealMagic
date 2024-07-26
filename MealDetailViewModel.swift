//
//  MealDetailViewModel.swift
//  MealMagic
//
//  Created by Shashank Sacheti on 7/25/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    private let mealService: MealServiceProtocol

    init(mealService: MealServiceProtocol = MealService()) {
        self.mealService = mealService
    }

    func fetchMealDetails(mealID: String) async {
        do {
            let mealDetail = try await mealService.fetchMealDetails(mealID: mealID)
            DispatchQueue.main.async {
                self.mealDetail = self.filterMealDetail(mealDetail)
            }
        } catch {
            print("Failed to fetch meal details: \(error)")
        }
    }

    func filterMealDetail(_ mealDetail: MealDetail) -> MealDetail {
        var filteredIngredients = [String?]()
        var filteredMeasurements = [String?]()
        
        // Created an array of all ingredients and measurements
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
        
        for (ingredient, measurement) in zip(ingredients, measurements) {
            if let ingredient = ingredient, !ingredient.isEmpty {
                filteredIngredients.append(ingredient)
                filteredMeasurements.append(measurement)
            }
        }
        
        return MealDetail(
            idMeal: mealDetail.idMeal,
            strMeal: mealDetail.strMeal,
            strInstructions: mealDetail.strInstructions,
            strMealThumb: mealDetail.strMealThumb,
            strIngredient1: filteredIngredients.count > 0 ? filteredIngredients[0] : nil,
            strIngredient2: filteredIngredients.count > 1 ? filteredIngredients[1] : nil,
            strIngredient3: filteredIngredients.count > 2 ? filteredIngredients[2] : nil,
            strIngredient4: filteredIngredients.count > 3 ? filteredIngredients[3] : nil,
            strIngredient5: filteredIngredients.count > 4 ? filteredIngredients[4] : nil,
            strIngredient6: filteredIngredients.count > 5 ? filteredIngredients[5] : nil,
            strIngredient7: filteredIngredients.count > 6 ? filteredIngredients[6] : nil,
            strIngredient8: filteredIngredients.count > 7 ? filteredIngredients[7] : nil,
            strIngredient9: filteredIngredients.count > 8 ? filteredIngredients[8] : nil,
            strIngredient10: filteredIngredients.count > 9 ? filteredIngredients[9] : nil,
            strIngredient11: filteredIngredients.count > 10 ? filteredIngredients[10] : nil,
            strIngredient12: filteredIngredients.count > 11 ? filteredIngredients[11] : nil,
            strIngredient13: filteredIngredients.count > 12 ? filteredIngredients[12] : nil,
            strIngredient14: filteredIngredients.count > 13 ? filteredIngredients[13] : nil,
            strIngredient15: filteredIngredients.count > 14 ? filteredIngredients[14] : nil,
            strIngredient16: filteredIngredients.count > 15 ? filteredIngredients[15] : nil,
            strIngredient17: filteredIngredients.count > 16 ? filteredIngredients[16] : nil,
            strIngredient18: filteredIngredients.count > 17 ? filteredIngredients[17] : nil,
            strIngredient19: filteredIngredients.count > 18 ? filteredIngredients[18] : nil,
            strIngredient20: filteredIngredients.count > 19 ? filteredIngredients[19] : nil,
            strMeasure1: filteredMeasurements.count > 0 ? filteredMeasurements[0] : nil,
            strMeasure2: filteredMeasurements.count > 1 ? filteredMeasurements[1] : nil,
            strMeasure3: filteredMeasurements.count > 2 ? filteredMeasurements[2] : nil,
            strMeasure4: filteredMeasurements.count > 3 ? filteredMeasurements[3] : nil,
            strMeasure5: filteredMeasurements.count > 4 ? filteredMeasurements[4] : nil,
            strMeasure6: filteredMeasurements.count > 5 ? filteredMeasurements[5] : nil,
            strMeasure7: filteredMeasurements.count > 6 ? filteredMeasurements[6] : nil,
            strMeasure8: filteredMeasurements.count > 7 ? filteredMeasurements[7] : nil,
            strMeasure9: filteredMeasurements.count > 8 ? filteredMeasurements[8] : nil,
            strMeasure10: filteredMeasurements.count > 9 ? filteredMeasurements[9] : nil,
            strMeasure11: filteredMeasurements.count > 10 ? filteredMeasurements[10] : nil,
            strMeasure12: filteredMeasurements.count > 11 ? filteredMeasurements[11] : nil,
            strMeasure13: filteredMeasurements.count > 12 ? filteredMeasurements[12] : nil,
            strMeasure14: filteredMeasurements.count > 13 ? filteredMeasurements[13] : nil,
            strMeasure15: filteredMeasurements.count > 14 ? filteredMeasurements[14] : nil,
            strMeasure16: filteredMeasurements.count > 15 ? filteredMeasurements[15] : nil,
            strMeasure17: filteredMeasurements.count > 16 ? filteredMeasurements[16] : nil,
            strMeasure18: filteredMeasurements.count > 17 ? filteredMeasurements[17] : nil,
            strMeasure19: filteredMeasurements.count > 18 ? filteredMeasurements[18] : nil,
            strMeasure20: filteredMeasurements.count > 19 ? filteredMeasurements[19] : nil
        )
    }
}
