//
//  JuiceItems.swift
//  DeliveryApp
//
//  Created by MAC PRO on 14/03/24.
//

import Foundation

struct FoodItem {
    let name: String
    let image: String
    let price: String
    let passFoodPrice: Int
    let rating: String
    let time: String
}

// Example usage:
let foodItems: [FoodItem] = [
    FoodItem(name: "Dosa(Roast)", image: "Dosa", price: "Rs.80", passFoodPrice: 80, rating: "4.4", time: "30 mins"),
    FoodItem(name: "Idli(2 Pieces)", image: "Idli", price: "Rs.30", passFoodPrice: 30, rating: "5.0", time: "20 mins"),
    FoodItem(name: "Poori(2 Pieces)", image: "poori", price: "Rs.70", passFoodPrice: 70, rating: "4.5", time: "40 mins"),
    FoodItem(name: "Chapathi(2 Pieces)", image: "chapati", price: "Rs.60", passFoodPrice: 60, rating: "5.0", time: "30 mins"),
    FoodItem(name: "Meals", image: "Rst2", price: "Rs.150", passFoodPrice: 150, rating: "4.4", time: "60 mins"),
    FoodItem(name: "Burger", image: "Rst3", price: "Rs.150", passFoodPrice: 150, rating: "4.8", time: "50 mins"),
    FoodItem(name: "Pizza", image: "Rst4", price: "Rs.150", passFoodPrice: 150, rating: "4.8", time: "50 mins")
]

struct JuiceItem {
    let itemImg: String
    let itemName: String
    let itemAbout: String
    let itemRating: String
    let itemTiming: String
    let itemPrice: String
    let itemPassPrice: Int
}

// Example usage:
let juiceItems: [JuiceItem] = [
    JuiceItem(itemImg: "Apple", itemName: "Fresh Apple Juice", itemAbout: "Maked with love", itemRating: "4.2", itemTiming: "20-30 Min", itemPrice: "Rs.80", itemPassPrice: 80),
    JuiceItem(itemImg: "Strawberry", itemName: "Strawberry Juice", itemAbout: "Maked with love", itemRating: "4.6", itemTiming: "30-40 Min", itemPrice: "Rs.120", itemPassPrice: 120),
    JuiceItem(itemImg: "Grape", itemName: "Fresh Grape Juice", itemAbout: "Maked with love", itemRating: "4.8", itemTiming: "40-45 Min", itemPrice: "Rs.80", itemPassPrice: 80),
    JuiceItem(itemImg: "Pineapple", itemName: "Fresh Pineapple Juice", itemAbout: "Maked with love", itemRating: "4.9", itemTiming: "25-30 Min", itemPrice: "Rs.80", itemPassPrice: 80),
    JuiceItem(itemImg: "Orange", itemName: "Fresh Orange Juice", itemAbout: "Maked with love", itemRating: "4.9", itemTiming: "25-30 Min", itemPrice: "Rs.60", itemPassPrice: 60)
]

struct DessertItem {
    let itemImg: String
    let itemName: String
    let itemAbout: String
    let itemRating: String
    let itemTiming: String
    let itemPrice: String
    let itemPassPrice: Int
}

// Example usage:
let dessertItems: [DessertItem] = [
    DessertItem(itemImg: "chocolate Desert", itemName: "chocolate Desert", itemAbout: "Maked with love", itemRating: "4.9", itemTiming: "25-30 Min", itemPrice: "Rs.80", itemPassPrice: 80),
    DessertItem(itemImg: "Amaretto brulee", itemName: "Amaretto brulee", itemAbout: "Maked with love", itemRating: "4.2", itemTiming: "20-30 Min", itemPrice: "Rs.30", itemPassPrice: 30),
    DessertItem(itemImg: "Chocolate banoffee pie", itemName: "Chocolate banoffee pie", itemAbout: "Maked with love", itemRating: "4.6", itemTiming: "30-40 Min", itemPrice: "Rs.70", itemPassPrice: 70),
    DessertItem(itemImg: "Mangomisu", itemName: "Mangomisu", itemAbout: "Maked with love", itemRating: "4.8", itemTiming: "40-45 Min", itemPrice: "Rs.60", itemPassPrice: 60),
    DessertItem(itemImg: "Black forest trifles", itemName: "Black forest trifles", itemAbout: "Maked with love", itemRating: "4.9", itemTiming: "25-30 Min", itemPrice: "Rs.180", itemPassPrice: 180)
]

struct CakeItem {
    let itemImg: String
    let itemName: String
    let itemAbout: String
    let itemRating: String
    let itemTiming: String
    let itemPrice: String
    let itemPassPrice: Int
}

// Example usage:
let cakeItems: [CakeItem] = [
    CakeItem(itemImg: "blackforest Cake", itemName: "Blackforest Cake", itemAbout: "Maked with love", itemRating: "4.9", itemTiming: "25-30 Min", itemPrice: "Rs.80", itemPassPrice: 80),
    CakeItem(itemImg: "Redwelvet Cake", itemName: "Redwelvet Cake", itemAbout: "Maked with love", itemRating: "4.2", itemTiming: "20-30 Min", itemPrice: "Rs.30", itemPassPrice: 30),
    CakeItem(itemImg: "Strawberry Cake", itemName: "Strawberry Cake", itemAbout: "Maked with love", itemRating: "4.6", itemTiming: "30-40 Min", itemPrice: "Rs.70", itemPassPrice: 70),
    CakeItem(itemImg: "Chocolate Cake", itemName: "Chocolate Cake", itemAbout: "Maked with love", itemRating: "4.8", itemTiming: "40-45 Min", itemPrice: "Rs.60", itemPassPrice: 60),
    CakeItem(itemImg: "Vanilla Cake", itemName: "Vanilla Cake", itemAbout: "Maked with love", itemRating: "4.9", itemTiming: "25-30 Min", itemPrice: "Rs.180", itemPassPrice: 180)
]

struct SnackItem {
    let itemImg: String
    let itemName: String
    let itemAbout: String
    let itemRating: String
    let itemTiming: String
    let itemPrice: String
    let itemPassPrice: Int
}

// Example usage:
let snackItems: [SnackItem] = [
    SnackItem(itemImg: "Samosa", itemName: "Samosa", itemAbout: "Maked with love", itemRating: "4.9", itemTiming: "25-30 Min", itemPrice: "Rs.80", itemPassPrice: 80),
    SnackItem(itemImg: "Pani Puri", itemName: "Pani Puri", itemAbout: "Maked with love", itemRating: "4.2", itemTiming: "20-30 Min", itemPrice: "Rs.30", itemPassPrice: 30),
    SnackItem(itemImg: "Pakora", itemName: "Pakora", itemAbout: "Maked with love", itemRating: "4.6", itemTiming: "30-40 Min", itemPrice: "Rs.70", itemPassPrice: 70),
    SnackItem(itemImg: "French Fries", itemName: "French Fries", itemAbout: "Maked with love", itemRating: "4.8", itemTiming: "40-45 Min", itemPrice: "Rs.60", itemPassPrice: 60),
    SnackItem(itemImg: "Potato Chips", itemName: "Potato Chips", itemAbout: "Maked with love", itemRating: "4.9", itemTiming: "25-30 Min", itemPrice: "Rs.180", itemPassPrice: 180)
]
