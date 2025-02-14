import SwiftUI

private let backgroundGradientStartColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
private let backgroundGradientEndColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)

struct LeaderboardView: View {
    
    var body: some View {
        VStack() {
            Text("Leaderboard")
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(backgroundGradientEndColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.bottom, 40)
                .padding(.top, 20)
            LeaderboardElement(playerPosition: 1, username: "usr001", playerPoints: 10000)
            LeaderboardElement(playerPosition: 2, username: "usr002", playerPoints: 5000)
            LeaderboardElement(playerPosition: 3, username: "usr003", playerPoints: 1000)
            LeaderboardElement(playerPosition: 4, username: "You", playerPoints: 500)
            Spacer()
        }
        .background(.white)
    }
}

struct LeaderboardElement: View {
    
    var playerPosition: Int
    var username: String
    var playerPoints: Int
    
    var body: some View {
        ZStack{
            HStack{
                ZStack {
                    Text(String(playerPosition))
                        .font(.system(size: 35, weight: .semibold))
                        .padding(.horizontal, 30)
                        .foregroundColor(playerPosition <= 3 ? Color(.white) : .black)
                }
                Text(username)
                    .foregroundColor(playerPosition <= 3 ? Color(.white) : .black)
                    .font(.system(size: 25, weight: .medium))
                Spacer()
                Text(String(playerPoints))
                    .foregroundColor(playerPosition <= 3 ? Color(.white) : .black)
                    .font(.system(size: 25, weight: .medium))
                    .padding(.trailing, 20)
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: playerPosition <= 3 ? ([backgroundGradientStartColor, backgroundGradientEndColor]) : ([.white, .white])),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(backgroundGradientEndColor, lineWidth:
                                playerPosition <= 3 ? 0 : 3)
            )
        .frame(height: 80)
        .cornerRadius(20)
        )
        .padding(.horizontal)
        .padding(.bottom, playerPosition == 3 ? 100 : 40)
    }
    
}

#Preview {
    LeaderboardView()
}
