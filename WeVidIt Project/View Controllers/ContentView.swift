//
//  ContentView.swift
//  WeVidIt Project
//
//  Created by FGT MAC on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State var citiesArray: [City] = [
        City(cityName: .Cannes),
        City(cityName: .Venice),
        City(cityName: .Berlin),
        City(cityName: .Other, isSelected: true)
    ]
    
    @State var selectionCounter = 0
    
    //MARK: - View
    var body: some View {
        NavigationView{
            VStack {
                
                List{
                    ForEach( 0..<citiesArray.count - 1, id: \.self){ index in
                        
                        Button (action:
                                    {
                                        citiesArray[index].toggle()
                                        if citiesArray[index].isSelected {
                                            selectionCounter += 1
                                        }else{
                                            selectionCounter -= 1
                                        }
                                    }){
                            HStack(alignment: .top, spacing: 10) {
                                Rectangle()
                                    .fill(citiesArray[index].isSelected ? Color.black : Color.black.opacity(0.2))
                                    .frame(width:20, height:20, alignment: .center)
                                    .cornerRadius(5)
                                
                                Text(citiesArray[index].cityName.rawValue)
                            }
                        }
                        
                    }
                    
                }.navigationTitle("Festivals")
                
                NavigationLink(destination:  SecondView(selectionsArray: citiesArray)) {
                    Text("NEXT").font(.system(size: 24))
                }.disabled(selectionCounter <= 0)
            }
        }.navigationViewStyle(StackNavigationViewStyle())//Use to prevent constrain errors
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
