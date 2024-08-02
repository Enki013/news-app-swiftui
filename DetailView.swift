//
//  DetailView.swift
//  newssapp
//
//  Created by enes on 2.08.2024.
//

import SwiftUI

struct DetailView: View {
    let article: NewsArticle
    @State private var isFavorited = false
    @State private var showShareSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Cover Image
                AsyncImage(url: URL(string: article.coverImageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 300)
                        .clipped()
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                        .frame(maxHeight: 300)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                // Title and Actions
                HStack {
                    Text(article.title)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)
                    Spacer()
                    Button(action: {
                        isFavorited.toggle()
                    }) {
                        Image(systemName: isFavorited ? "heart.fill" : "heart")
                            .foregroundColor(isFavorited ? .red : .gray)
                            .padding()
                    }
                    
                    Button(action: {
                        showShareSheet.toggle()
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .padding()
                    }
                    .sheet(isPresented: $showShareSheet) {
                        ShareSheet(activityItems: [article.title, article.content])
                    }
                }
                
                // Date
                Text(dateFormatter.string(from: article.date))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Content
                Text(article.content)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle("Detay")
        .background(Color(.systemBackground))
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}

// Paylaşım Sheet'i
struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
