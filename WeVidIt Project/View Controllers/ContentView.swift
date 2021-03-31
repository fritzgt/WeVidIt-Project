//
//  ContentView.swift
//  WeVidIt Project
//
//  Created by FGT MAC on 3/31/21.
//

import SwiftUI

enum Cities: String {
    case Cannes, Venice, Berlin
}

struct ContentView: View {
    
    //MARK: - Properties
    @State var selectionsArray = [Cities]()
    @State var isCannes = false
    @State var isVenice = false
    @State var isBerlin = false
    
    //MARK: - View
    var body: some View {
        NavigationView{
            VStack {
                
                Form{
                    Button (action:
                                {
                                    self.isCannes = !isCannes
                                    addRemoveFromArray(.Cannes)
                                }){
                        HStack(alignment: .top, spacing: 10) {
                            Rectangle()
                                .fill(self.isCannes ? Color.black : Color.white)
                                .frame(width:20, height:20, alignment: .center)
                                .cornerRadius(5)
                                .border(Color.black)
                            
                            Text(Cities.Cannes.rawValue)
                            
                        }
                    }
                    
                    
                    Button (action:
                                {
                                    self.isVenice = !isVenice
                                    addRemoveFromArray(.Venice)
                                }){
                        HStack(alignment: .top, spacing: 10) {
                            Rectangle()
                                .fill(self.isVenice ? Color.black : Color.white)
                                .frame(width:20, height:20, alignment: .center)
                                .cornerRadius(5)
                                .border(Color.black)
                            
                            Text(Cities.Venice.rawValue)
                            
                        }
                    }
                    
                    
                    Button (action:
                                {
                                    self.isBerlin = !isBerlin
                                    addRemoveFromArray(.Berlin)
                                }){
                        HStack(alignment: .top, spacing: 10) {
                            Rectangle()
                                .fill(self.isBerlin ? Color.black : Color.white)
                                .frame(width:20, height:20, alignment: .center)
                                .cornerRadius(5)
                                .border(Color.black)
                            
                            Text(Cities.Berlin.rawValue)
                            
                        }
                    }
                    
                }.navigationTitle("Festivals")
                
                NavigationLink(destination:  SecondView(selectionsArray: selectionsArray)) {
                    Text("NEXT").font(.system(size: 24))
                }.disabled(selectionsArray.count <= 0)
            }
        }
    }
    
    //MARK: - Private Methods
    private func addRemoveFromArray(_ city: Cities) {
        if let item = selectionsArray.firstIndex(of: city){
            selectionsArray.remove(at: item)
        }else{
            selectionsArray.append(city)
        }
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
