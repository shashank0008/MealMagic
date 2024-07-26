//
//  MealMagicTests.swift
//  MealMagicTests
//
//  Created by Shashank Sacheti on 7/25/24.
//

//
//  MealMagicTests.swift
//  MealMagicTests
//
//  Created by Shashank Sacheti on 7/25/24.
//

//
//  MealMagicTests.swift
//  MealMagicTests
//
//  Created by Shashank Sacheti on 7/25/24.
//

import XCTest
@testable import MealMagic

final class MealMagicTests: XCTestCase {
    var viewModel: MealDetailViewModel!
    var mockMealService: MockMealService!

    override func setUpWithError() throws {
        mockMealService = MockMealService()
        viewModel = MealDetailViewModel(mealService: mockMealService)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockMealService = nil
    }

    func testFetchMealDetailsSuccess() async throws {
        let expectedMealDetail = MealDetail(
            idMeal: "12345",
            strMeal: "Test Meal",
            strInstructions: "Test Instructions",
            strMealThumb: "https://www.example.com/image.jpg",
            strIngredient1: "Chicken", strIngredient2: "Salt", strIngredient3: nil, strIngredient4: nil, strIngredient5: nil,
            strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil,
            strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil,
            strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil,
            strMeasure1: "1 kg", strMeasure2: "1 tsp", strMeasure3: nil, strMeasure4: nil, strMeasure5: nil,
            strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil,
            strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil,
            strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil
        )

        mockMealService.mealDetail = expectedMealDetail

        await viewModel.fetchMealDetails(mealID: "12345")
        let _ = try await Task.sleep(nanoseconds: 500_000_000) // added 0.5 seconds

        XCTAssertEqual(viewModel.mealDetail?.idMeal, expectedMealDetail.idMeal)
        XCTAssertEqual(viewModel.mealDetail?.strMeal, expectedMealDetail.strMeal)
        XCTAssertEqual(viewModel.mealDetail?.strInstructions, expectedMealDetail.strInstructions)
        XCTAssertEqual(viewModel.mealDetail?.strMealThumb, expectedMealDetail.strMealThumb)
        XCTAssertEqual(viewModel.mealDetail?.strIngredient1, expectedMealDetail.strIngredient1)
        XCTAssertEqual(viewModel.mealDetail?.strIngredient2, expectedMealDetail.strIngredient2)
        XCTAssertEqual(viewModel.mealDetail?.strMeasure1, expectedMealDetail.strMeasure1)
        XCTAssertEqual(viewModel.mealDetail?.strMeasure2, expectedMealDetail.strMeasure2)
    }

    func testFilterMealDetail() throws {
        let mealDetail = MealDetail(
            idMeal: "12345",
            strMeal: "Test Meal",
            strInstructions: "Test Instructions",
            strMealThumb: "https://www.example.com/image.jpg",
            strIngredient1: "Chicken", strIngredient2: "Salt", strIngredient3: "", strIngredient4: nil, strIngredient5: nil,
            strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil,
            strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil,
            strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil,
            strMeasure1: "1 kg", strMeasure2: "1 tsp", strMeasure3: "", strMeasure4: nil, strMeasure5: nil,
            strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil,
            strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil,
            strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil
        )

        let filteredMealDetail = viewModel.filterMealDetail(mealDetail)

        XCTAssertEqual(filteredMealDetail.strIngredient1, "Chicken")
        XCTAssertEqual(filteredMealDetail.strIngredient2, "Salt")
        XCTAssertNil(filteredMealDetail.strIngredient3)
        XCTAssertEqual(filteredMealDetail.strMeasure1, "1 kg")
        XCTAssertEqual(filteredMealDetail.strMeasure2, "1 tsp")
        XCTAssertNil(filteredMealDetail.strMeasure3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            let expectation = self.expectation(description: "Fetch meal details")
            Task {
                await viewModel.fetchMealDetails(mealID: "12345")
                expectation.fulfill()
            }
            waitForExpectations(timeout: 5, handler: nil)
        }
    }
}

// Mock MealService to simulate network calls
class MockMealService: MealServiceProtocol {
    var mealDetail: MealDetail?
    var meals: [Meal] = []

    func fetchMealDetails(mealID: String) async throws -> MealDetail {
        if let mealDetail = mealDetail {
            return mealDetail
        } else {
            throw URLError(.badServerResponse)
        }
    }

    func fetchMeals(category: String) async throws -> [Meal] {
        if meals.isEmpty {
            throw URLError(.badServerResponse)
        }
        return meals
    }
}
