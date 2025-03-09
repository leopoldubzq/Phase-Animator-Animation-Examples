import SwiftUI

struct HeartBeatEffectView: View {
    
    @State private var hapticTrigger: Bool = false
    
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .foregroundStyle(.red.gradient)
            .phaseAnimator([true, false]) { content, phase in
                content
                    .scaleEffect(phase ? 1.2 : 1.0)
                    .shadow(color: .red, radius: phase ? 24 : 0)
                    .onChange(of: phase) { _, _ in
                        hapticTrigger.toggle()
                    }
            } animation: { phase in
                    .smooth(duration: phase ? 0.15 : 0.7)
            }
            .sensoryFeedback(.impact, trigger: hapticTrigger)
    }
}

#Preview {
    HeartBeatEffectView()
}
