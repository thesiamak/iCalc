//
//  ContentView.swift
//  Simple Calc
//
//  Created by Siamak Mahmoudi on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    private let math = Math()
    private let defaultValue = 0.0000000
    @State private var typedNum: Double?
    @State private var selectedOp: Operation?
    @State private var displayedNum = 0.0000000
    
    
    var body: some View {
        let numbers = 1...9
        let columns = 3
        
        VStack(alignment: .trailing) {
            Text("\(displayedNum)")
                .font(.system(size: 36))
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .padding(.all, 6.0)
                .frame(maxWidth: .infinity)
                .frame(height: 80.0)
            
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { column in
                        let numberIndex = row * columns + column + 1
                        
                        Button("\(numberIndex)"){
                            numClick(pressesNum: numberIndex)
                        }
                        .frame(width: 60.0, height: 60.0)
                        .border(.gray)
                        .cornerRadius(6.0)
                        .font(.system(size: 24))
                    }
                }
            }
            HStack {
                Button("."){
                    
                }
                .frame(width: 60.0, height: 60.0)
                .border(.gray)
                .cornerRadius(6.0)
                .font(.system(size: 24))
                Button("0"){
                    numClick(pressesNum: 0)
                }
                .frame(width: 125.0, height: 60.0)
                .border(.gray)
                .cornerRadius(6.0)
                .font(.system(size: 24))
            }
            
            
            HStack {
                VStack {
                    Button("x"){
                        opClick(op: Operation.Mult)
                    }
                    .frame(width: 60.0, height: 60.0)
                    .border(.brown)
                    .cornerRadius(6.0)
                    .font(.system(size: 24))
                    
                    Button("C"){
                        opClick(op: Operation.Clear)
                    }
                    .frame(width: 60.0, height: 60.0)
                    .border(.red)
                    .cornerRadius(6.0)
                    .font(.system(size: 24))
                    
                }
                VStack {
                    Button("/"){
                        opClick(op: Operation.div)
                    }
                    .frame(width: 60.0, height: 60.0)
                    .border(.green)
                    .cornerRadius(6.0)
                    .font(.system(size: 24))
                    
                    Button("-"){
                        opClick(op: Operation.Minus)
                    }
                    .frame(width: 60.0, height: 60.0)
                    .border(.yellow)
                    .cornerRadius(6.0)
                    .font(.system(size: 24))
                    
                }
                VStack {
                    Button("+"){
                        opClick(op: Operation.Sum)
                    }
                    .frame(width: 125, height: 125.0)
                    .border(.blue)
                    .cornerRadius(6.0)
                    .font(.system(size: 24))
                    
                }
            }
            
        }
        .padding()
    }
    
    private func numClick(pressesNum: Int){
        print("typed:\(typedNum ?? -1)")
        print("OP:\(selectedOp)")
        
        if typedNum == nil {
            typedNum = Double(pressesNum)
            displayedNum = typedNum ?? defaultValue
        }else {
            let result: Double?
            let pressedDouble = Double(pressesNum)
            switch selectedOp {
            case .Sum:
                result = math.sum(first: typedNum ?? 0, to: pressedDouble)
            case .Minus:
                result = math.minus(first: typedNum ?? 0, to: pressedDouble)
            case .div:
                result = math.div(origin: typedNum ?? 0, to: pressedDouble)
            case .Mult:
                result = math.mult(origin: typedNum ?? 0, to: pressedDouble)
            default:
                let typedStr = Double("\(typedNum?.toStringWithoutTrailingZeros() ?? "")\(pressesNum)")
                typedNum = typedStr
                displayedNum = typedNum ?? defaultValue
                return
            }
            
            displayedNum = result ?? defaultValue
            selectedOp = nil
            typedNum = result
        }
        
    }
    
    private func opClick(op:Operation){
        selectedOp = op
        if op == .Clear {
            typedNum = nil
            displayedNum = defaultValue
        }
        
    }
}

#Preview {
    ContentView()
}
