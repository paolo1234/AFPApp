//
//  HomeView 2.swift
//  AFPapp
//
//  Created by Matteo Molino on 14/02/25.
//


import SwiftUI
private let backgroundGradientEndColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
private let backgroundGradientStartColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)


struct HomeView: View {
        
    let DIFFICULTY_ICON_NAME: String = "bolt.fill"
    @State var progress: Double = 0.5
    @State var theoryProgress: Double = 0.3
    @State var quizProgress: Double = 0.7
    var body: some View {
        NavigationStack {
            List {
                Section(title: "DATA TYPES", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress)
                
                Section(title: "OPERATORS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress)

                
                Section(title: "CONTROL FLOW", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress)
                
                Section(title: "STRINGS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress)
                
                Section(title: "FUNCTIONS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress)
                
                Section(title: "STRUCTURES", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress)
                
            }
            .listRowSpacing(20)
            .scrollContentBackground(.hidden)
            .background(Color.white)
            .navigationTitle("Home")
        }
    }
}




struct RectangleHome: View {
    
    var title: String
    var subTitle: String
    var difficulty: Int = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                //.foregroundColor(Color(red: 0.125, green: 0.302, blue: 0.392))
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack{
                ForEach (1...difficulty, id: \.self) {_ in
                    
                    Image(systemName:subTitle).foregroundColor(Color.white)
                }
            }.padding(.top, 12)
        }
    }
}



struct PercentageHome: View {
    @Binding var progress: Double

    
    var body: some View {
            ZStack {
                // 2
                CircularProgressView(progress: progress)
                // 3
            }.frame(width: 70, height: 70)
    }
}

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        if progress < 1 {
            ZStack {
                Circle()
                    .stroke(
                        Color(red: 0.941, green: 0.318, blue: 0.22).opacity(0.5),
                        lineWidth: 10
                    )
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color(red: 1, green: 0.255, blue: 0.161),
                        style: StrokeStyle(
                            lineWidth: 10,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                // 1
                    .animation(.easeOut, value: progress)
                
            }
            Text("\(progress * 100, specifier: "%.0f")%")
            .foregroundColor(.white)
            .font(.system(size: 20))
            .bold()
        }else{
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .transition(.scale)
                    .animation(.easeInOut, value: 1)
        }
    }
}


struct Section: View {
    var title: String
    var subTitle: String
    var difficulty: Int = 1
    @State var isOpen : Bool = false
    @Binding var progress: Double
    
    var body: some View {
        VStack {
            
            Button (
                action: { self.isOpen.toggle() },
                label: {
                    
                    HStack(alignment: .center) {
                        RectangleHome(title: title, subTitle: subTitle, difficulty: difficulty)
                            .padding(.trailing)
                        
                        Spacer()
                        
                        PercentageHome(progress: $progress)
                            .frame(width: 60, alignment: .trailing)
                    }
                    .padding()
                    
                }
            ).sheet(isPresented: $isOpen ){SubSection().presentationDetents([.fraction(0.2)])}
            
        }
        .background(
            LinearGradient(
                    gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ).cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),                          startPoint: .leading, endPoint: .trailing)))
            )
      
 
    }
}
struct SubSection: View {
@State private var connection : Bool = false
    var body: some View {
            
            HStack{
                    Button(
                        
                        action:{self.connection.toggle()},
                        label:{
                            VStack(){
                                
                                Text("Quiz")}}
                    )
                    .buttonStyle(PlainButtonStyle())
                    .background(LinearGradient(
                        gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing).cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(LinearGradient(gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]), startPoint: .leading, endPoint: .trailing)))
                            .frame(width: 180, height: 130)
                    )
                
                Spacer().frame(width: 130)
                
                
                    Button(
                        
                    action:{},
                    label:{ VStack{
                        Text("Theory")  }}
                    
                    ).buttonStyle(PlainButtonStyle())
                    .background(
                    LinearGradient(
                        gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                        ).cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(LinearGradient(gradient: Gradient(colors:   [backgroundGradientStartColor, backgroundGradientEndColor]), startPoint: .leading, endPoint: .trailing)))
                        .frame(width: 180, height: 130)
                    )
                    
                
                
            }
            .foregroundColor(.white)
            .font(.system(size: 23, weight: .medium))
            .frame(maxWidth: 390, alignment: .center)
            .multilineTextAlignment(.center)
            
            
                
    }
}

#Preview {
    HomeView()
}
