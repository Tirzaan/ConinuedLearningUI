// Lesson 22
//
//  SwiftUITimer.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/11/25.
//

import SwiftUI

struct SwiftUITimer: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    // Current Time
    /*
    @State var  currentDate: Date = Date()
    var dateFormater: DateFormatter {
        let formater = DateFormatter()
//        formater.dateStyle = .medium
        formater.timeStyle = .medium
        return formater
    }
     */
    
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
     */
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([ .minute, .second], from: Date(), to: futureDate)
//        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute):\(second)"
    }
     */
    
    // Animation Counter
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
            colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))],
            center: .center,
            startRadius: 5,
            endRadius: 500
            ).ignoresSafeArea()
            
            // Current Time, Countdown, Countdown to date
            /*
            Text"/*Countdown to date*//*timeRemaining*/ /*Countdown*//*finishedText ?? "\(count)"*/ /*Current Time*//*dateFormater.string(from: currentDate)*/)
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
             */
            
            // Animated Counter
            /*
            HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .frame(width: 150)
            .foregroundStyle(.white)
             */
            
            // Animated Counter (Page View)
            TabView(selection: $count) {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(.purple)
                    .tag(5)
            }
            .frame(height: 200)
            .tabViewStyle(.page)
        }
        .onReceive(timer) { value in
            // Animation Counter
            withAnimation(.easeInOut){
//                count = count == 3 ? 0 : count + 1
                
                //Page
                count = count == 5 ? 1 : count + 1
            }
            
            // Countdown to date
            /*
            updateTimeRemaining()
             */
            
            // Countdown
            /*
            if count <= 1 {
                finishedText = "WOW!"
            } else {
                count -= 1
            }
             */
            
            // Current Time
            /*
            currentDate = value
             */
        }
    }
}

#Preview {
    SwiftUITimer()
}
