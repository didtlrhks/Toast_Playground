//
//  ContentView.swift
//  Toast_playground
//
//  Created by 양시관 on 3/24/24.
//
import SwiftUI
import PopupView

struct ContentView: View {
  @State var isPresentedFloating: Bool = false
  
  var body: some View {
    VStack {
      Button(
        action: { isPresentedFloating.toggle() },
        label: {
          Text("Show Floating")
        }
      )
    }
    .padding()
    .popup(isPresented: $isPresentedFloating) {
      FloatingView()
    } customize: {
      $0
        .type(.floater())
        .position(.bottom)
        .autohideIn(1.0)
        .animation(.spring())
        .closeOnTapOutside(true)
        .backgroundColor(.clear)
    }
  }
}


private struct FloatingView: View {
  var body: some View {
    HStack {
      Spacer()
      Text("This is Floating")
        .font(.headline)
        .padding(.vertical, 10)
      Spacer()
    }
    .background(Color.white)
    .cornerRadius(20)
    .padding(.horizontal, 20)
  }
}

#Preview {
    ContentView()
}
