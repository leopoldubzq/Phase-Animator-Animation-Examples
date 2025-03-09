import SwiftUI

struct ContentView: View {
    
    @State private var selectedEffect: PhaseAnimationEffectStyle = .heartBeat
    
    var body: some View {
        VStack {
            Picker("Phase animator effect style", selection: $selectedEffect) {
                ForEach(PhaseAnimationEffectStyle.allCases, id: \.self) { effect in
                    Button(effect.name) {
                        selectedEffect = effect
                    }
                }
            }
            .pickerStyle(.segmented)
            
            Group {
                switch selectedEffect {
                case .heartBeat:
                    HeartBeatEffectView()
                case .ringBell:
                    RingBellEffectView()
                }
            }
            .frame(maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    enum PhaseAnimationEffectStyle: CaseIterable {
        case heartBeat
        case ringBell
        
        var name: String {
            switch self {
            case .heartBeat:
                "heart beat"
            case .ringBell:
                "ring bell"
            }
        }
    }
}
