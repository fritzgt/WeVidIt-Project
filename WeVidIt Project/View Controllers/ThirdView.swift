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
        //Use to set the inital value for the textfield
        self._input = State(wrappedValue: finalSelection.cityName.rawValue)
    }
    
    //MARK: - body
    var body: some View {
        
        
        HStack{
            VStack{
                TextField(input, text: $input)
                    .font(Font.system(size: 24, design: .default))
                    .padding(.leading, 10)
                Divider().frame(height: 2).background(Color.black)
                
            }
            Button("➕ Add") {
                if input != ""{
                    entryArray.append(input)
                    input = ""//Clear textField
                }
            }.foregroundColor(.black).frame(width: 80, height: 40, alignment: .center).overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 2)
            ).padding()
        }
        ScrollView(.horizontal, content: {
            HStack(spacing: 15) {
                ForEach(0..<entryArray.count, id: \.self){ index in
                    if entryArray[index] != ""{
                        
                        Button(action: {
                            
                        }) {
                            HStack{
                                Text(entryArray[index]).font(Font.system(size: 20, design: .default))
                                Button("X") {
                                    entryArray.remove(at: index)
                                }.frame(width: 30, height: 30)
                                .foregroundColor(Color("customPurple"))
                                .background(Color.black)
                                .clipShape(Circle())
                                .font(Font.system(size: 20, design: .default).bold())
                            }
                        }.padding(10)
                        .background(Color("customPurple"))
                        .cornerRadius(40)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("customPurple"), lineWidth: 5)
                        )
                    }
                }
            }.padding()
        }
        )
        Spacer()
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(finalSelection: City(cityName: .Other))
    }
}

