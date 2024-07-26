//
//  MealServiceProtocol.swift
//  MealMagic
//
//  Created by Shashank Sacheti on 7/26/24.
//

import Foundation

protocol MealServiceProtocol {
    func fetchMeals(category: String) async throws -> [Meal]
    func fetchMealDetails(mealID: String) async throws -> MealDetail
}
