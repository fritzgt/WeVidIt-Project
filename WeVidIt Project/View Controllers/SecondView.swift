//
//  SecondView.swift
//  WeVidIt Project
//
//  Created by FGT MAC on 3/31/21.
//

import SwiftUI

struct SecondView: View {
    var selectionsArray: [City]?
    @State var selectedCity: City?
    
    var body: some View {
        List{
            ForEach(0..<selectionsArray!.count, id: \.self) { index in
                if selectionsArray![index].isSelected{
                    Button (action:
                                {
                                    selectedCity = selectionsArray![index]
                                }){
                        HStack(alignment: .top, spacing: 10) {
                            Circle()
                                .fill(selectedCity == selectionsArray![index] ? Color.black : Color.black.opacity(0.2))
                                .frame(width:20, height:20)
                            Text(selectionsArray![index].cityName.rawValue)
                        }
                    }

                }
            }
        }
        NavigationLink(destination:  ThirdView(finalSelection: selectedCity)) {
            Text("NEXT").font(.system(size: 24))
        }.disabled(selectedCity?.cityName == nil)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
