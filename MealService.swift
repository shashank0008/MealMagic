//
//  MealService.swift
//  MealMagic
//
//  Created by Shashank Sacheti on 7/25/24.
//

import Foundation

class MealService: MealServiceProtocol {
    private let baseURL = "https://themealdb.com/api/json/v1/1"

    // Fetching meals by category
    func fetchMeals(category: String) async throws -> [Meal] {
        guard let url = URL(string: "\(baseURL)/filter.php?c=\(category)") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealListResponse.self, from: data)
        return response.meals
    }

    // Fetching meal details by ID
    func fetchMealDetails(mealID: String) async throws -> MealDetail {
        guard let url = URL(string: "\(baseURL)/lookup.php?i=\(mealID)") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        return response.meals.first!
    }
}

