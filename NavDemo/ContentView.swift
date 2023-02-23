//
//  ContentView.swift
//  NavDemo
//
//  Created by Ehsan Taghavi on 23.02.2023.
//

import SwiftUI

struct Company: Identifiable, Hashable{
    var id = UUID()
    let name:String
}
struct Stock: Identifiable, Hashable{
    var id = UUID()
    let ticker:String
}

struct ContentView: View {
    let companies:[Company] = [
        .init(name: "Apple"),
        .init(name: "Facebook"),
        .init(name: "Google"),
        .init(name: "Microsoft"),
        .init(name: "Dell"),
    ]
    let stocks:[Stock] = [
        .init(ticker: "APPL"),
        .init(ticker: "FB"),
        .init(ticker: "GOOGL"),
        .init(ticker: "MSFT"),
    ]
    var body: some View {
        NavigationStack{
            List {
                Section("Companies"){
                    ForEach(companies){ company in
                        NavigationLink(company.name,value: company)
                    }
                }
                Section("Stocks"){
                    ForEach(stocks) { stock in
                        NavigationLink(stock.ticker,value: stock)
                    }
                }
            }
            .navigationDestination(for: Company.self){ company in
                Text(company.name)
            }
            .navigationDestination(for: Stock.self){ stock in
                Text(stock.ticker)
                    .font(.headline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
