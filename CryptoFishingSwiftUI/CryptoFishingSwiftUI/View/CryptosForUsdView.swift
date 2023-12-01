//
//  ContentView.swift
//  CryptoFishingSwiftUI
//
//  Created by Berat Rıdvan Asiltürk on 1.12.2023.
//

import SwiftUI

struct CryptosForUsdView: View {
    
    @ObservedObject var cryptoListViewModel: CryptoListViewModel
    
    init(cryptoListViewModel: CryptoListViewModel) {
        self.cryptoListViewModel = cryptoListViewModel
    }
    
    var body: some View {
        
        NavigationView {
            List(cryptoListViewModel.cryptoList, id: \.id) { crypto in
                VStack {
                    HStack {
                        Text(crypto.name)
                            .font(.subheadline)
                            .bold()
                            
                        Image(crypto.image)
                        
                        Text("(\(crypto.symbol))")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                        Text(String(crypto.price))
                        .font(.caption2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .navigationTitle("Cryptos Usd Currency")
            }
            .onAppear{
                cryptoListViewModel.downloadCryptos(url: URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en")!)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CryptosForUsdView(cryptoListViewModel: .init())
    }
}