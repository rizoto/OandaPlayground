//
//  ContentView.swift
//  Scrolly
//
//  Created by Lubor Kolacny on 13/5/20.
//  Copyright © 2020 Lubor Kolacny. All rights reserved.
//

import SwiftUI

final class MouseEvents: ObservableObject {
    var monitor: Any?
    @Published var lastEvent: NSEvent?
    init() {
        monitor = NSEvent.addLocalMonitorForEvents(matching: .scrollWheel, handler: { event in
            print(event)
            return event
        })
    }
}

struct ContentView: View {
    @ObservedObject var mouseEvents = MouseEvents()
    @State private var counter: Double = 0
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(1..<10) {  _ in
                            Rectangle().frame(width: 100, height: 100, alignment: .topLeading)
                        }
                    }
                }
                Rectangle().frame(width: 100, height: 100, alignment: .topLeading)
                Path { p in
                    p.move(to: CGPoint(x: 0.0, y: 100.0))
                    p.addLine(to: CGPoint(x: 100.0, y: 100.0))
                }.stroke()
                Slider(value: self.$counter, in: 0...100, step: 0.5).accessibility(identifier: "slider")
                Text(String(self.counter)).accessibility(identifier: "text")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
