//
//  ContentViewModel.swift
//  HoverAnimationDemo
//
//  Created by Moksh on 20/01/25.
//

import SwiftUI

class ContentViewModel : ObservableObject {
    @Published var hoverLocation : CGPoint = .zero
    @Published var isHovering : Bool = false
    @Published var centerOfCard : CGPoint = CGPoint(x: 150, y: 150)
    
    @Published var rotationX : Double = 0
    @Published var rotationY : Double = 0
    
    func didHover(_ phase : HoverPhase) {
        switch phase {
        case .active(let cGPoint):
            hoverLocation = cGPoint
            self.setRotation()
            withAnimation {
                self.isHovering = true
            }
        case .ended:
            withAnimation {
                hoverLocation = .zero
                setRotation()
                self.isHovering = false
            }
        }
    }
    
    func setRotation(){
        let hoverLocationPerspectiveToCenter = CGPoint(x: hoverLocation.x - centerOfCard.x, y: hoverLocation.y - centerOfCard.y)
      
        rotationX = hoverLocationPerspectiveToCenter.y/80
        rotationY = -hoverLocationPerspectiveToCenter.x/80
    }
}
