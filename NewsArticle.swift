//
//  NewsArticle.swift
//  newssapp
//
//  Created by enes on 2.08.2024.
//
import Foundation

enum Category: String, CaseIterable {
    case all = "Tümü"
    case technology = "Teknoloji"
    case health = "Sağlık"
    case sports = "Spor"
    // Diğer kategoriler
}

struct NewsArticle: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let content: String
    let coverImageURL: String
    let category: Category
    let date: Date
}
