import SwiftUI

struct HomeView: View {
    
    let DIFFICULTY_ICON_NAME: String = "bolt.fill"
    @State var progress: Double = 0.5
    @State var theoryProgress: Double = 0.3
    @State var quizProgress: Double = 0.7
    var body: some View {
        NavigationStack {
            List {
                Collapsible_main(
                    label: Section(title: "DATA TYPES", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress),
                content: SubSection(theoryProgress: $theoryProgress, quizProgress: $quizProgress)
                )
                
                Collapsible_main(
                    label: Section(title: "OPERATORS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress),
                content: SubSection(theoryProgress: $theoryProgress, quizProgress: $quizProgress)
                )
                
                Collapsible_main(
                    label: Section(title: "CONTROL FLOW", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress),
                    content: SubSection(theoryProgress: $theoryProgress, quizProgress: $quizProgress)
                )
                
                Collapsible_main(
                    label: Section(title: "STRINGS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress),
                    content: SubSection(theoryProgress: $theoryProgress, quizProgress: $quizProgress)
                )
                
                Collapsible_main(
                    label: Section(title: "FUNCTIONS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress),
                    content: SubSection(theoryProgress: $theoryProgress, quizProgress: $quizProgress)
                )
                
                Collapsible_main(
                    label: Section(title: "STRUCTURES", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress),
                    content: SubSection(theoryProgress: $theoryProgress, quizProgress: $quizProgress)
                )
                
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
    
    @Binding var progress: Double
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                RectangleHome(title: title, subTitle: subTitle, difficulty: difficulty)
                    .padding(.trailing)
                
                Spacer()
                
                PercentageHome(progress: $progress)
                    .frame(width: 60, alignment: .trailing)
            }
            .padding()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.984, green: 0.639, blue: 0.239), Color(red: 1, green: 0.255, blue: 0.161)]), startPoint: .trailing, endPoint: .leading))
        .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 0.941, green: 0.318, blue: 0.22), Color(red: 0.941, green: 0.318, blue: 0.22).opacity(0.5)]), startPoint: .leading, endPoint: .trailing)))
      
 
    }
}
struct SubSection: View {
    @Binding var theoryProgress : Double
    @Binding var quizProgress : Double
    var body: some View {
        
        
        VStack(spacing: 20) {
            
            HStack{
                VStack{
                    PercentageHome(progress: $quizProgress)
                        .frame(width: .none, height: 80, alignment: .trailing)
                    
                    Button(
                        
                        action:{},
                        label:{ Text("Quiz")    }
                        
                    )
                    .buttonStyle(PlainButtonStyle())
                }
                
                Spacer().frame(width: 90)
                
                VStack{
                    PercentageHome(progress: $theoryProgress)
                        .frame(width: .none, height: 80, alignment: .trailing)
                    Button(
                        
                    action:{},
                    label:{ Text("Theory")  }
                    
                    ).buttonStyle(PlainButtonStyle())
                }
                
                
            }
            .foregroundColor(.white)
            .font(.system(size: 23, weight: .medium))
            .frame(maxWidth: 390, alignment: .center)
            .multilineTextAlignment(.center)
            
        }.background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.984, green: 0.639, blue: 0.239), Color(red: 1, green: 0.255, blue: 0.161)]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(40)
            .overlay(RoundedRectangle(cornerRadius: 40)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 0.941, green: 0.318, blue: 0.22), Color(red: 0.941, green: 0.318, blue: 0.22).opacity(0.5)]), startPoint: .leading, endPoint: .trailing)))
                
    }
}

struct Collapsible_main: View {
    @State var label: Section
    @State var content: SubSection
    
    @State var collapsed: Bool = true
    var body: some View {
        VStack {
            Button(
                action: { self.collapsed.toggle()},
                label: {
                        self.label
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            Spacer().frame(height:0)
            
            VStack {
                self.content
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeIn)
            .transition(.slide)
            
        }
    }
}

#Preview {
    HomeView()
}
