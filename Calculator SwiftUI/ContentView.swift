
import SwiftUI

struct MenuItem: Identifiable, Hashable {
    var id = UUID()
    let inputLine: String
    let result: String
}


struct ContentView: View {
    
    //Declare global variables that detect change
    @State var lineOne = ""
    @State var lineTwo = ""
    @State var operation = ""
    @State var bringLine = false
    @State var result = ""
    @State var menuOpened: Bool = false
    @State var inputLine = ""
    
    @State var items: [MenuItem] = [
        ]
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                
                // Text Line Constants
                
                let lineWidth = UIScreen.main.bounds.width-10
                let lineHeight = CGFloat(70)
                let lineTextColour = Color.white
                let lineFontSize:CGFloat = 50
                let lineBackground = Color.gray
                let lineCornerRadius:CGFloat = 7
                let inputLineHeight:CGFloat = 230
                
                    
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
        
                Group {
                    Button(action: {

                    }, label: {
                        Text("\(inputLine)")
                            .padding()
                            .frame(width: lineWidth, height: inputLineHeight, alignment: .leading)
                            .font(.system(size: lineFontSize))
                            .foregroundColor(lineTextColour)
                            .background(lineBackground)
                            .cornerRadius(lineCornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: lineCornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
                    })
                    Button(action: {
                        if result != "" {
                            inputLine = result
                        }
                    }, label: {
                        Text("\(result)")
                            .padding()
                            .frame(width: lineWidth, height: lineHeight, alignment: .leading)
                            .font(.system(size: lineFontSize))
                            .foregroundColor(lineTextColour)
                            .background(lineBackground)
                            .cornerRadius(lineCornerRadius)
                            .overlay(
                                RoundedRectangle(cornerRadius: lineCornerRadius)
                                    .stroke(Color.black, lineWidth: 1))
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
                            input(input: "\(number)")
                            print((UIScreen.main.bounds.width - (buttonSize*4)) / 5)
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
                        input(input: "+")
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
                            input(input: "\(number)")
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
                        input(input: "-")
                        
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
                            input(input: "\(number)")
                            
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
                        input(input: "*")
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
                        input(input: "0")
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
                        input(input: ".")
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
                        input(input: "/")
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
                        bringLine = true
                        
                    }, label: {
                        Text("=")
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
                        inputLine = String(inputLine.dropLast())
                    }, label: {
                        Text("␡")
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
                        inputLine = ""
                    }, label: {
                        Text("C")
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
            }
            
            SideMenu(width: UIScreen.main.bounds.width/1.6,
                     menuOpened: menuOpened,
                     toggleMenu: toggleMenu,
                     menuContent: MenuContent(items: $items, inputLine: $inputLine, result: $result))
            .edgesIgnoringSafeArea(.all)
        }
    }

    func calculate() -> String {
        if inputLine.contains("++") || inputLine.contains("--") || inputLine.contains("**") || inputLine.contains("//") {
            return "Error"
        }
        else {
            let expn = NSExpression(format:inputLine)
            let calc:String = "\(expn.expressionValue(with: nil, context: nil) ?? 0)"
            print(calc)
            addItem(intputLine: inputLine, res: calc)
            return calc
        }
    }

    // Input number into text lines
    func input(input:String)
    {
        if result == "error" // if result is error reset entire calculator
        {
            result = ""
            inputLine = ""
        }
//        if bringLine == true {
//            if input == "/" || input == "+" || input == "*" || input == "-" {
//                inputLine = "\(result) + \(input)"
//                bringLine = false
//            }
//        }
        inputLine += ("\(input)")
    }
    
    func toggleMenu() {
        menuOpened.toggle()
    }
        
    func addItem(intputLine:String, res:String) {
        items.append(MenuItem(inputLine: inputLine, result: res))
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
            .background(Color.black.opacity(0.25))
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
    @Binding var inputLine: String
    @Binding var result: String

    var body: some View {
        ZStack {
            Color(UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1))

            ScrollView {
                ForEach(items.reversed()) { item in
                    VStack {
                        Button(action: {
                            inputLine = item.inputLine
                            result = item.result
                        }, label: {
                            Text("\(item.inputLine) = \(item.result)")
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


