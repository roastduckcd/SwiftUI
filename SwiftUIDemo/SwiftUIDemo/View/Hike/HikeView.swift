/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view displaying inforamtion about a hike, including an elevation graph.
 */

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
//        AnyTransition.slide
//        AnyTransition.move(edge: .leading)
        let inTransaction = AnyTransition.move(edge: .leading)
                                         .combined(with: AnyTransition.opacity)
        let outTransaction = AnyTransition.scale.combined(with: .opacity)

        return AnyTransition.asymmetric(insertion: inTransaction, removal: outTransaction)
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button(action: {
                    withAnimation{
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(Angle(degrees: showDetail ? 90 : 0))
//                        .animation(nil)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
//                        .animation(.default)
//                        .animation(.spring())
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(AnyTransition.moveAndFade)
            }
        }
    }
}

#if DEBUG
struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
//            HikeView(hike: hikeData[0])
//                .padding()
            Spacer()
        }
    }
}
#endif
