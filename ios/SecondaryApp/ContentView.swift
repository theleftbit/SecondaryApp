import SwiftUI

struct ContentView: View {
    private let mediquoURL = URL(string: "https://www.mediquo.com/app")!
    private let appStoreURL = URL(
        string: "https://apps.apple.com/es/app/mediquo-chat-consulta-m%C3%A9dica/id1320968041"
    )!

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
        Task {
            let didOpenApp = await UIApplication.shared.open(
                mediquoURL,
                options: [.universalLinksOnly: true]
            )

            if !didOpenApp {
                await UIApplication.shared.open(appStoreURL)
            }
        }
    }
}

#Preview {
    ContentView()
}
