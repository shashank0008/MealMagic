//
//  MealListViewModel.swift
//  MealMagic
//
//  Created by Shashank Sacheti on 7/25/24.
//

import Foundation

class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    private let mealService = MealService()

    func fetchMeals() async {
        do {
            let meals = try await mealService.fetchMeals(category: "Dessert")
            DispatchQueue.main.async {
                self.meals = meals
                    .filter { !$0.strMeal.isEmpty }
                    .sorted { $0.strMeal < $1.strMeal }
            }
        } catch {
            print("Failed to fetch meals: \(error)")
        }
    }
}

