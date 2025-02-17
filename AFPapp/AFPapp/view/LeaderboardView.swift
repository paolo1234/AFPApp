import SwiftUI

// private let backgroundGradientStartColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
// private let backgroundGradientEndColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)

struct LeaderboardView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var leaderboardViewModel = LeaderboardViewModel()
    
    var body: some View {
        VStack {
            List(leaderboardViewModel.topUsers) { user in
                        HStack {
                            if let position = user.posizione {
                                Circle()
                                    .fill(position == 1 ? Color(red: 0.855, green: 0.647, blue: 0.125) : (position == 2 ? Color(red: 0.753, green: 0.753, blue: 0.753) : (position == 3 ? Color(red: 0.984, green: 0.639, blue: 0.239) : Color.white)))
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Text("\(position)")
                                            .padding()
                                            .font(.title2)
                                            .foregroundStyle(position == 1 ? Color.white : (position == 2 ? Color.white : (position == 3 ? Color.white : Color.black)))
                                    )
                            }
                            if let me = viewModel.currentUser {
                                Text(user.username == me.username ? "You" : user.username)
                                    .font(.title2)
                                    .padding()
                            } else {
                                Text(user.username)
                                    .font(.title2)
                                    .padding()
                            }
                            
                            Spacer()
                            Text("\(user.punteggio)")
                                .font(.title2)
                                .padding()
                        }
                    }
                    .task {
                        await leaderboardViewModel.fetchTop3Users()
                    }
            
            if (viewModel.currentUser != nil) && leaderboardViewModel.topUsers.count >= 3 && (viewModel.currentUser!.posizione != nil) {
                if viewModel.currentUser!.punteggio < leaderboardViewModel.topUsers[2].punteggio {
                    LeaderboardElement(
                        playerPosition: viewModel.currentUser!.posizione!,
                        username: viewModel.currentUser!.username,
                        playerPoints: viewModel.currentUser!.punteggio
                    )
                }
            }

            
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
        .environmentObject(AuthViewModel())
}
