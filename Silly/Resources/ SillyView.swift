//
//  SillyView.swift
//  Silly
//
//  Created by Wunderli, Samie on 1/5/23.
//

import SwiftUI

struct SillyView: View
{
    @State var count = 0
    @State var randomIndex = 0
    @State var scalar = 0.1
    @State var rotate = 0.0
    @State var options = ["😈","👿","🤪","😇","🤢","😘","🤓","🤮","💀","😮‍💨","😬","🥴","💪🏾","🙌🏾"]
    var body: some View
    {
        ZStack
        {
            Text(options[randomIndex])
                .font((.system(size: CGFloat(20.0 * scalar))))
                .rotationEffect(Angle(degrees: rotate))
                .rotation3DEffect(Angle(degrees: rotate * scalar),
                                  axis: (x: 12.0, y: 10.0 , z: 0.0))
            VStack
            {
                Button("Click me!", action: update)
                Text("Clicking is fun: \(count)")
            }
            .padding()
        }
        
        
        
    }
    private func update() -> Void
    {
        count += 1
        scalar += 0.07
        rotate += 0.4
        
        if (scalar > 15)
        {
            scalar = 0.1
        }
        
        if (rotate > 50)
        {
            rotate = 0.0
        }
        
        if (count % 17 == 0)
        {
            randomIndex = Int(arc4random()) % options.count
        }
    }
    
}
    struct ContentView_Previews: PreviewProvider
{
        static var previews: some View
        {
            SillyView()
        }
    }

