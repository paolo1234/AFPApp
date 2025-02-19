import SwiftUI
import FirebaseAuth

private let goldMedal: Color = Color(red: 0.988, green: 0.761, blue: 0.004)
private let silverMedal: Color = Color(red: 0.753, green: 0.753, blue: 0.753)
private let bronzeMedal: Color = Color(red: 0.808, green: 0.537, blue: 0.275)

struct LeaderboardView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var leaderboardViewModel = LeaderboardViewModel()
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.system(size: 40, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            List(leaderboardViewModel.topUsers) { user in
                HStack {
                    if let position = user.posizione {
                        Circle()
                            .fill(position == 1 ? goldMedal : (position == 2 ? silverMedal : (position == 3 ? bronzeMedal : Color.white)))
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
                            .fontWeight(user.username == me.username ? .bold : .regular)
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
            .onAppear {
                leaderboardViewModel.listenToTop3Users()
            }
            
            
            // Visualizza la card in fondo solo se l'utente corrente NON è già tra i top 3
            if let currentUser = viewModel.currentUser,
               !leaderboardViewModel.topUsers.contains(where: { $0.username == currentUser.username }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray5))
                    .frame(width: UIScreen.main.bounds.width - 40, height: 90)
                    .overlay(
                        HStack(alignment: .center) {
                            if let posizione = currentUser.posizione {
                                Text("\(posizione)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                    .frame(width: 50, height: 50)
                                    .background(Color(.systemGray5))
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.orange, lineWidth: 3))
                                    .padding()
                            }
                            
                            Spacer()
                            
                            Text(currentUser.username)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.trailing, 30)
                            
                            Spacer()
                            
                            Text("\(currentUser.punteggio)")
                                .font(.title3)
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .padding()
                        }
                    )
                    .padding(.bottom, 40)
            }
        }
        .scrollContentBackground(.hidden)
        .background(LinearGradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
    }
}

#Preview {
    LeaderboardView()
        .environmentObject(AuthViewModel())
}
