import Foundation

let sampleArticles = [

    NewsArticle(title: "Yeni Sağlık Trendleri",
                description: "Sağlık alanındaki en yeni trendler hakkında bilgi edinin.",
                content: """
                Sağlık sektörü sürekli değişiyor ve yeni trendler ortaya çıkıyor. Bu yazıda, 2024'te sağlık alanında dikkat çeken en son trendlere göz atacağız.
                
                Yapay zeka ve makine öğrenimi, sağlık hizmetlerinde kişiselleştirilmiş tedavi yaklaşımlarını mümkün kılıyor. Ayrıca, tele sağlık hizmetleri ve uzaktan izleme teknolojilerinin nasıl geliştiği ve sağlık sektörünü nasıl dönüştürdüğünü keşfedeceksiniz.
                
                Ayrıca, yeni nesil sağlık uygulamaları ve dijital sağlık teknolojilerinin etkilerini tartışacağız.
                """,
                coverImageURL: "https://picsum.photos/800/400?random=2",
                category: .health,
                date: Date(timeIntervalSinceNow: -86400 * 1)), // 1 gün önce

    NewsArticle(title: "Spor Dünyasında Son Gelişmeler",
                description: "Spor dünyasında yaşanan en son gelişmeleri takip edin.",
                content: """
                Spor dünyasında her geçen gün yeni gelişmeler yaşanıyor. Bu yazıda, spor dünyasında öne çıkan son haberleri ve gelişmeleri inceleyeceğiz.
                
                Son turnuvalar, şampiyonluklar ve oyuncu transferleri hakkında detaylı bilgiler bulacaksınız. Ayrıca, büyük spor etkinliklerinin sonuçlarını ve gelecekteki önemli maçları da ele alacağız.
                
                Spor endüstrisinin ekonomi üzerindeki etkileri ve medyanın spor üzerindeki etkisi hakkında da bilgi edineceksiniz.
                """,
                coverImageURL: "https://picsum.photos/800/400?random=3",
                category: .sports,
                date: Date(timeIntervalSinceNow: -86400 * 2)), // 2 gün önce

    NewsArticle(title: "Teknolojide Son Yenilikler",
                description: "Teknoloji dünyasındaki en son yenilikleri keşfedin.",
                content: """
                Teknoloji dünyasında her gün yeni yenilikler ortaya çıkıyor. Bu yazıda, son dönemde dikkat çeken teknoloji trendlerine göz atacağız.
                
                Yeni akıllı telefonlar, giyilebilir teknolojiler, ve yapay zeka uygulamalarındaki son gelişmeleri inceleyeceğiz. Ayrıca, teknoloji devlerinin yeni ürün lansmanlarını ve teknoloji alanındaki büyük değişimleri tartışacağız.
                
                Teknolojinin hayatımızı nasıl değiştirdiğine dair güncel bilgiler ve analizler bulacaksınız.
                """,
                coverImageURL: "https://picsum.photos/800/400?random=4",
                category: .technology,
                date: Date(timeIntervalSinceNow: -86400 * 7)), // 1 hafta önce

    NewsArticle(title: "Küresel İklim Değişikliği",
                description: "Küresel iklim değişikliğinin etkileri ve çözümleri üzerine bir inceleme.",
                content: """
                Küresel iklim değişikliği, tüm dünya çapında büyük etkilere yol açıyor. Bu yazıda, iklim değişikliğinin çevre, ekonomi ve toplum üzerindeki etkilerini inceleyeceğiz.
                
                Karbon salınımını azaltma stratejileri, yenilenebilir enerji kaynakları, ve sürdürülebilir yaşam tarzları hakkında bilgi edineceksiniz. Ayrıca, iklim değişikliği ile mücadelede toplumların ve ülkelerin nasıl adımlar attığını da tartışacağız.
                
                Çevresel krizlerin nasıl yönetileceği ve bireylerin bu süreçte nasıl katkıda bulunabileceği hakkında bilgi vereceğiz.
                """,
                coverImageURL: "https://picsum.photos/800/400?random=5",
                category: .health,
                date: Date(timeIntervalSinceNow: -86400 * 30)) // 1 ay önce
]
