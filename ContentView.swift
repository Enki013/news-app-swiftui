//
//  ContentView.swift
//  newssapp
//
//  Created by enes on 2.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedCategory: Category = .all
    @State private var selectedDateRange: DateRange = .all
    @State private var showFilterSheet = false
    
    let articles: [NewsArticle] = sampleArticles
    
    var filteredArticles: [NewsArticle] {
        let filteredByCategory = articles.filter { article in
            (selectedCategory == .all || article.category == selectedCategory)
        }
        
        let filteredByDate = filteredByCategory.filter { article in
            switch selectedDateRange {
            case .all:
                return true
            case .last24Hours:
                return Calendar.current.isDateInToday(article.date) || Calendar.current.dateComponents([.hour], from: article.date, to: Date()).hour! < 24
            case .lastWeek:
                return Calendar.current.dateComponents([.weekOfYear], from: article.date, to: Date()).weekOfYear! < 1
            case .lastMonth:
                return Calendar.current.dateComponents([.month], from: article.date, to: Date()).month! < 1
            }
        }
        
        return filteredByDate.filter { article in
            searchText.isEmpty || article.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Arama Çubuğu ve Filtreleme Butonu
                HStack {
                    TextField("Haber Ara...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        showFilterSheet.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding(.trailing)
                    }
                    .sheet(isPresented: $showFilterSheet) {
                        FilterSheet(selectedCategory: $selectedCategory, selectedDateRange: $selectedDateRange)
                    }
                }
                
                // Kategoriler
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(Category.allCases, id: \.self) { category in
                            CategoryButton(category: category, isSelected: selectedCategory == category) {
                                selectedCategory = category
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Slider (Kaydırma)
                TabView {
                    ForEach(articles.prefix(3)) { article in
                        NavigationLink(destination: DetailView(article: article)) {
                            AsyncImage(url: URL(string: article.coverImageURL)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                                    .frame(maxWidth: .infinity, maxHeight: 200)
                                    .background(Color.gray.opacity(0.2))
                            }
                        }
                        .frame(height: 200)
                        .cornerRadius(8)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 200)
                .padding(.bottom, 16)
                
                // Haberler Listesi
                List(filteredArticles) { article in
                    NavigationLink(destination: DetailView(article: article)) {
                        HStack {
                            AsyncImage(url: URL(string: article.coverImageURL)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height: 100)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(article.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(dateFormatter.string(from: article.date))
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading, 8)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Haberler")
            }
            .accentColor(.blue) // Accent color for NavigationView and interactive elements
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}

// Tarih aralığı enum
enum DateRange: String, CaseIterable {
    case all = "Tümü"
    case last24Hours = "Son 24 Saat"
    case lastWeek = "Son 1 Hafta"
    case lastMonth = "Son 1 Ay"
}

// Modern Kategori Butonu
struct CategoryButton: View {
    let category: Category
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(category.rawValue)
                .font(.subheadline)
                .bold()
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
    }
}

// MARK: - Filtreleme Sheet'i
struct FilterSheet: View {
    @Binding var selectedCategory: Category
    @Binding var selectedDateRange: DateRange
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Kategoriler")) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            HStack {
                                Text(category.rawValue)
                                Spacer()
                                if selectedCategory == category {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("Tarih Aralığı")) {
                    ForEach(DateRange.allCases, id: \.self) { dateRange in
                        Button(action: {
                            selectedDateRange = dateRange
                        }) {
                            HStack {
                                Text(dateRange.rawValue)
                                Spacer()
                                if selectedDateRange == dateRange {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
                
                Button("Clear Filter") {
                    selectedCategory = .all
                    selectedDateRange = .all
                }
                .foregroundColor(.red)
            }
            .navigationTitle("Filtrele")
            .navigationBarItems(trailing: Button("Tamam") {
                presentationMode.wrappedValue.dismiss() // Dismiss the sheet
            })
        }
    }
}
