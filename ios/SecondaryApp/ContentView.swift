import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: openMediquoApp) {
            Text("Abrir app de mediQuo")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding()
                .frame(width: 168, height: 168)
                .background(.black, in: Circle())
                .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background)
    }

    private func openMediquoApp() {
        guard let url = URL(string: "https://www.mediquo.com/app") else {
            return
        }

        UIApplication.shared.open(url)
    }
}

#Preview {
    ContentView()
}
