
import SwiftUI

struct MenuItem: Identifiable, Hashable {
    var id = UUID()
    let lineOne: String
    let operation: String
    let lineTwo: String
    let result: String
}


struct ContentView: View {
    
    //Declare global variables that detect change
    @State var lineOne = ""
    @State var lineTwo = ""
    @State var operation = ""
    @State var linePos = 0
    @State var result = ""
    @State var menuOpened: Bool = false
    
    @State var items: [MenuItem] = [
        ]
    var body: some View {
        
        ZStack {
            Color.mint
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                
                // Text Line Constants
                
                let lineWidth = UIScreen.main.bounds.width
                let lineHeight = CGFloat(70)
                let lineTextColour = Color.pink
                let lineFontSize:CGFloat = 50
                let lineBackground = Color.white
                
                    
                Spacer()
                
                    Button(action: {
                        self.menuOpened.toggle()
                    }, label: {
                        Text("History")
                            .frame(width: 200, height: 40)
                            .font(.system(size:20))
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.black, lineWidth: 1))
                    })
//                    .padding(.vertical, 30)

                Spacer()
                
                // place textLine in dictionary
                
                let lines: [Int: String] =
                [
                    0: lineOne,
                    1: operation,
                    2: lineTwo,
                    3: result
                ]
                
                // Print out each value in dictionary with iteration
                ForEach(lines.keys.sorted(by: <), id: \.self) { key in
                    Button(action: {
                        linePos = key
                    }, label: {
                        Text("\(lines[key]!)")
                            .padding()
                            .frame(width: lineWidth, height: lineHeight, alignment: .leading)
                            .font(.system(size: lineFontSize))
                            .foregroundColor(lineTextColour)
                            .background(lineBackground)
                    })
                }
                
                Spacer()
                
                // Button Constants
                
                let buttonSize = CGFloat(90)
                let buttonFontSize = buttonSize / 1.4
                let cornerRadius = buttonSize * 0.185
                let numTextColour = Color.white
                let numBackground = Color.gray
                let buttonSpacing = (UIScreen.main.bounds.width - (buttonSize*4)) / 5
                
                // Draw Buttons
                
                HStack(spacing: buttonSpacing) {
                    
                    // First Row
                    ForEach(7...9, id: \.self) { number in
                        Button(action: {
                            inputNumber(num: "\(number)")
                        }, label: {
                            Text("\(number)")
                                .frame(width: buttonSize, height: buttonSize)
                                .font(.system(size:buttonFontSize))
                                .foregroundColor(numTextColour)
                                .background(numBackground)
                                .cornerRadius(cornerRadius)
                                .overlay(
                                    RoundedRectangle(cornerRadius: cornerRadius)
                                        .stroke(Color.black, lineWidth: 1))
                        })
                    }
                    
                    Button(action: {
                        operation = "+"
                        changeLine()
                    }, label: {
                        Text("+")
                            .frame(width: buttonSize, height: buttonSize)
                            .font(.system(size:buttonFontSize))
                            .foregroundColor(numTextColour)
                            .background(numBackground)
                            .cornerRadius(cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                }
                
                // Second Row
                HStack(spacing: buttonSpacing) {
                    
                    ForEach(4...6, id: \.self) { number in
                        Button(action: {
                            inputNumber(num: "\(number)")
                        }, label: {
                            Text("\(number)")
                                .frame(width: buttonSize, height: buttonSize)
                                .font(.system(size:buttonFontSize))
                                .foregroundColor(numTextColour)
                                .background(numBackground)
                                .cornerRadius(cornerRadius)
                                .overlay(
                                    RoundedRectangle(cornerRadius: cornerRadius)
                                        .stroke(Color.black, lineWidth: 1))
                        })
                    }
                    Button(action: {
                        operation = "-"
                        changeLine()
                        
                    }, label: {
                        Text("-")
                            .frame(width: buttonSize, height: buttonSize)
                            .font(.system(size:buttonFontSize))
                            .foregroundColor(numTextColour)
                            .background(numBackground)
                            .cornerRadius(cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                }
                
                // Third Row
                HStack(spacing: buttonSpacing) {
                    
                    ForEach(1...3, id: \.self) { number in
                        Button(action: {
                            inputNumber(num: "\(number)")
                            
                        }, label: {
                            Text("\(number)")
                                .frame(width: buttonSize, height: buttonSize)
                                .font(.system(size:buttonFontSize))
                                .foregroundColor(numTextColour)
                                .background(numBackground)
                                .cornerRadius(cornerRadius)
                                .overlay(
                                    RoundedRectangle(cornerRadius: cornerRadius)
                                        .stroke(Color.black, lineWidth: 1))
                        })
                    }
                    Button(action: {
                        operation = "*"
                        changeLine()
                    }, label: {
                        Text("×")
                            .frame(width: buttonSize, height: buttonSize, alignment: .center)
                            .font(.system(size:buttonFontSize))
                            .foregroundColor(numTextColour)
                            .background(numBackground)
                            .cornerRadius(cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                }
                
                //Fourth Row
                HStack(spacing: buttonSpacing) {
                    Button(action: {
                        inputNumber(num: "0")
                    }, label: {
                        Text("0")
                            .frame(width: (buttonSize*2 + buttonSpacing), height: buttonSize, alignment: .center)
                            .font(.system(size:buttonFontSize))
                            .foregroundColor(numTextColour)
                            .background(numBackground)
                            .cornerRadius(cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                    
                    Button(action: {
                        if linePos == 0 && !lineOne.contains(".")
                        {
                            lineOne += "."
                        }
                        else if linePos == 2 && !lineTwo.contains(".")
                        {
                            lineOne += "."
                        }
                        
                    }, label: {
                        Text(".")
                            .frame(width: buttonSize, height: buttonSize)
                            .font(.system(size:buttonFontSize))
                            .foregroundColor(numTextColour)
                            .background(numBackground)
                            .cornerRadius(cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                    
                    Button(action: {
                        operation = "/"
                        changeLine()
                    }, label: {
                        Text("÷")
                            .frame(width: buttonSize, height: buttonSize)
                            .font(.system(size:buttonFontSize))
                            .foregroundColor(numTextColour)
                            .background(numBackground)
                            .cornerRadius(cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                }
                
                // Fifth Row
                HStack(spacing: buttonSpacing) {
                    Button(action: {
                        result = calculate()
                        linePos = 3
                    }, label: {
                        Text("=")
                            .frame(width: (buttonSize*3 + buttonSpacing*2), height: buttonSize, alignment: .center)
                            .font(.system(size:buttonFontSize))
                            .foregroundColor(numTextColour)
                            .background(numBackground)
                            .cornerRadius(cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                    
                    Button(action: {
                        
                        if linePos == 0
                        {
                            lineOne = ""
                        }
                        else if linePos == 2
                        {
                            lineTwo = ""
                        }
                        else
                        {
                            lineOne = ""
                            lineTwo = ""
                        }
                        
                    }, label: {
                        Text("\(linePos)")
                            .frame(width: buttonSize, height: buttonSize)
                            .font(.system(size:buttonFontSize))
                            .foregroundColor(numTextColour)
                            .background(numBackground)
                            .cornerRadius(cornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                }
//                Spacer()
            }
            
            SideMenu(width: UIScreen.main.bounds.width/1.6,
                     menuOpened: menuOpened,
                     toggleMenu: toggleMenu,
                     menuContent: MenuContent(items: $items, lineOne: $lineOne, operation: $operation, lineTwo: $lineTwo, result: $result))
            .edgesIgnoringSafeArea(.all)
        }
    }

    // Do calculations function
    func calculate() -> String {
        if lineOne != "" || lineTwo != "" || operation != ""
        {
            var maths = ""
            if lineOne.contains(".") && lineTwo.contains(".")
            {
                maths = "\(lineOne) \(operation) \(lineTwo)"
            }
            else if lineOne.contains(".")
            {
                maths = "\(lineOne) \(operation) \(lineTwo).0"
            }
            else if lineTwo.contains(".")
            {
                maths = "\(lineOne).0 \(operation) \(lineTwo)"
            }
            else
            {
                maths = "\(lineOne).0 \(operation) \(lineTwo).0"
            }
            let expn = NSExpression(format:maths)
            let calc:String = "\((expn.expressionValue(with: nil, context: nil) ?? 0))"
            print(calc)
            addItem(lOne: lineOne, oper: operation, lTwo: lineTwo, res: calc)
            return calc
        }
        else // if does not meet things above that would crash the app return an error
        {
            return "error"
        }
    }
    
    // Input number into text lines
    func inputNumber(num:String)
    {
        if result == "error" // if result is error reset entire calculator
        {
            lineOne = ""
            lineTwo = ""
            linePos = 0
            result = ""
        }
        if linePos == 0 // if top line type on top line
        {
            lineOne += ("\(num)")
        }
        else if linePos == 2 // if second line type second line
        {
            lineTwo += ("\(num)")
        }
        else if linePos == 3 // if continued typing after enter pressed, push result to first line and continue on second line
        {
            lineOne = result
            lineTwo = ""
            lineTwo += ("\(num)")
            linePos = 2
        }
    }
    
    func changeLine() // if operater is pressed, move to next line
    {
        if linePos == 0
        {
            linePos = 2
        }
    }
    
    func toggleMenu() {
        menuOpened.toggle()
    }
        
    func addItem(lOne:String, oper:String, lTwo:String, res:String) {
        items.append(MenuItem(lineOne: lOne, operation: oper, lineTwo: lTwo, result: res))
        print(items)
    }
}

struct SideMenu: View {
    let width:CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    var menuContent: MenuContent
    var body: some View {
        ZStack {
            // Dimmed background view
            GeometryReader { _ in
                // EmptyView()
            }
            .background(Color.red.opacity(0.25))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25), value: menuOpened)
            .onTapGesture {
                self.toggleMenu()
            }
            
            // Menu Content
            HStack{
                menuContent
                    .frame(width:width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default, value: menuOpened)
                
                Spacer()
            }
        }
    }
}

struct MenuContent: View {
    @Binding var items: [MenuItem]
    @Binding var lineOne: String
    @Binding var operation: String
    @Binding var lineTwo: String
    @Binding var result: String
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1))
            
            ScrollView {
                ForEach(items.reversed()) { item in
                    VStack {
                        Button(action: {
                            lineOne = item.lineOne
                            operation = item.operation
                            lineTwo = item.lineTwo
                            result = item.result
                        }, label: {
                            Text("\(item.lineOne) \(item.operation) \(item.lineTwo) = \(item.result)")
                                .frame(maxWidth: .infinity, maxHeight: 100)
                                .font(.system(size:40))
                                .foregroundColor(Color.red)
//                                .background(Color.black)
                                .cornerRadius(50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color.black, lineWidth: 1))
                        })
//                        Spacer()
                    }
//                    .padding()
                }
//                Spacer()
            }
            .padding(.vertical, 50)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


