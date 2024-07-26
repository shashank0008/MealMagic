//
//  ContentView.swift
//  MealMagic
//
//  Created by Shashank Sacheti on 7/25/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                    Text(meal.strMeal)
                }
            }
            .navigationTitle("Dessert Recipes")
        }
        .task {
            await viewModel.fetchMeals()
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}

