import SwiftUI

private let backgroundGradientStartColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
private let backgroundGradientEndColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)

struct ProfileView: View {
    
    var body: some View {
        VStack() {
            Text("Profile")
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(backgroundGradientEndColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.bottom, 40)
                .padding(.top, 20)
            ProfileSection(username: "bernardo", playerLevel: "INTERMEDIATE", playerPoints: 10000)
        }
        .background(.white)
    }
}


struct ProfileSection: View {
    
    var username: String
    var playerLevel: String
    var playerPoints: Int
    
    var body: some View {
        VStack() {
            ZStack() {
                VStack() {
                    HStack() {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 89, height: 89)
                            .foregroundColor(.white)
                        VStack(alignment: .leading) {
                            Text(username)
                                .font(.system(size: 28, weight: .semibold))
                            Text("Level: " + playerLevel)
                            Text("Total points: " + String(playerPoints))
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 19, weight: .medium))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    Button(action: {}) {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 129, height: 50)
                                .foregroundColor(.white)
                            Text("Log In")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
            )
            .frame(height: 200)
            .cornerRadius(20)
                    
            )
            .padding(.horizontal)
            .padding(.bottom, 170)
            Button(action: {}) {
                Text("Reset")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)
                    .overlay(
                            RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange, lineWidth: 2)
                            .frame(width: 153, height: 50)
                    )
            }
            Spacer()
        }
    }
}




#Preview {
    ProfileView()
}
