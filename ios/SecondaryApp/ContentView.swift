import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: performPrimaryAction) {
            Circle()
                .fill(.primary)
                .frame(width: 96, height: 96)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Accion principal")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background)
    }

    private func performPrimaryAction() {}
}

#Preview {
    ContentView()
}

