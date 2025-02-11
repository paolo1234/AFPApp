import SwiftUI

struct HomeView: View {
    
    @State var progress: Double = 0.5
    
    var body: some View {
        NavigationStack {
            List {
                Section(title: "DATA TYPES", subTitle: "Difficulty: EASY", progress: $progress)
                Section(title: "OPERATORS", subTitle: "Difficulty: EASY", progress: $progress)
                Section(title: "CONTROL FLOW", subTitle: "Difficulty: EASY", progress: $progress)
                Section(title: "STRINGS", subTitle: "Difficulty: EASY", progress: $progress)
                Section(title: "FUNCTIONS", subTitle: "Difficulty: EASY", progress: $progress)
                Section(title: "STRUCTURES", subTitle: "Difficulty: EASY", progress: $progress)
            }
            .listRowSpacing(20)
            .scrollContentBackground(.hidden)
            .background(Color.white)
        }
    }
}




struct RectangleHome: View {
    
    var title: String
    var subTitle: String
    
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
            
            Text(subTitle)
                //.foregroundColor(Color(red: 0.125, green: 0.302, blue: 0.392))
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .light))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
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
    
    @Binding var progress: Double
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                RectangleHome(title: title, subTitle: subTitle)
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



#Preview {
    HomeView()
}
