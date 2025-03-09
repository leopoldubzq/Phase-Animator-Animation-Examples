import SwiftUI

struct RingBellEffectView: View {
    
    @State private var trigger: Bool = false
    
    var body: some View {
        VStack {
            ringBell
            
            Button("Ring") {
                trigger.toggle()
            }
        }

    }
    
    private var ringBell: some View {
        Image(systemName: "bell.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 22, height: 22)
            .foregroundStyle(.yellow)
            .padding(24)
            .phaseAnimator([0, 8, -8, 4, -4, 3, -3, 2, -2, 1, -1, 0], trigger: trigger) { content, offset in
                content
                    .offset(x: offset)
            } animation: { _ in
                    .snappy(duration: 0.07, extraBounce: 0.0)
            }
            .phaseAnimator([false, true], trigger: trigger) { content, phase in
                content
                    .scaleEffect(phase ? 2.0 : 1.0)
                    .rotationEffect(.degrees(phase ? 15 : 0))
            } animation: { phase in
                    .smooth(duration: phase ? 0.7 : 0.3, extraBounce: 0.0)
            }
    }
}

#Preview {
    RingBellEffectView()
}
