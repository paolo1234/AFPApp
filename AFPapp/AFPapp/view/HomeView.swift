import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section(title: "DATA TYPES", subTitle: "Difficulty: EASY", percentage: "100")
                Section(title: "OPERATORS", subTitle: "Difficulty: EASY", percentage: "100")
                Section(title: "CONTROL FLOW", subTitle: "Difficulty: EASY", percentage: "100")
                Section(title: "STRINGS", subTitle: "Difficulty: EASY", percentage: "100")
                Section(title: "FUNCTIONS", subTitle: "Difficulty: EASY", percentage: "100")
                Section(title: "STRUCTURES", subTitle: "Difficulty: EASY", percentage: "100")
            }
            .listRowSpacing(30)
            .scrollContentBackground(.hidden)
            .background(Color(red: 0.125, green: 0.302, blue: 0.392))
        }
    }
}




struct RectangleHome: View {
    
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundColor(Color(red: 0.125, green: 0.302, blue: 0.392))
                .font(.system(size: 25, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Text(subTitle)
                .foregroundColor(Color(red: 0.125, green: 0.302, blue: 0.392))
                .font(.system(size: 15, weight: .light))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
        }
    }
}



struct PercentageHome: View {
    var percentage: String
    
    var body: some View {
        Text(percentage + "%")
            .foregroundColor(Color(red: 0.055, green: 0.224, blue: 0.31))
            .font(.system(size: 20, weight: .bold))
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)
            .frame(width: 60, alignment: .trailing)
    }
}


struct Section: View {
    var title: String
    var subTitle: String
    var percentage: String
    
    var body: some View {
        HStack(alignment: .top) {
            RectangleHome(title: title, subTitle: subTitle)
            
            Spacer()
            
            PercentageHome(percentage: percentage)
                .frame(width: 60, alignment: .trailing)
        }
        .padding(.horizontal)
    }
}



#Preview {
    HomeView()
}
