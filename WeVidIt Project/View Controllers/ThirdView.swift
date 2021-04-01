//
//  ThirdView.swift
//  WeVidIt Project
//
//  Created by FGT MAC on 3/31/21.
//

import SwiftUI

struct ThirdView: View {
    //MARK: - Properties
    @State private var input: String = ""
    var finalSelection: City? {
        didSet{
            input = finalSelection!.cityName.rawValue
            print("Did set")
        }
    }
    @State var entryArray: [String] = [""]
    
    init(finalSelection: City){
        self.finalSelection = finalSelection
        self._input = State(wrappedValue: finalSelection.cityName.rawValue)
    }
   
    //MARK: - body
    var body: some View {
        
        HStack{
            VStack{
                
                    
                    TextField(input, text: $input)
                        .font(Font.system(size: 24, design: .default))
                        .padding(.leading, 10)
                    Divider()
                
            }
            Button("+ Add") {
                //Create the action here
                if input != ""{
                    entryArray.append(input)
                    input = ""//Clear field
                }
            }.frame(width: 80, height: 40, alignment: .center).overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 2)
            ).padding()
        }
        List {
            ForEach(0..<entryArray.count, id: \.self){ index in
                if entryArray[index] != ""{
                    HStack{
                        Text(entryArray[index])
                        Button("X") {
                            entryArray.remove(at: index)
                        }
                    }
                }
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(finalSelection: City(cityName: .Other))
    }
}

