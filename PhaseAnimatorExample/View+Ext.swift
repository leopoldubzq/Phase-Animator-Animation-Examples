import SwiftUI

extension View {
    func heartBeatEffect() -> some View {
        self
            .phaseAnimator([true, false]) { content, phase in
                content
                    .scaleEffect(phase ? 1.2 : 1.0)
                    .shadow(color: .red, radius: phase ? 24 : 0)
            } animation: { phase in
                    .smooth(duration: phase ? 0.15 : 0.7)
            }
    }
}
