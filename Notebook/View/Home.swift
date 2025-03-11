//
//  Home.swift
//  Notebook
//
//  Created by Benji Loya on 11.03.2025.
//

import SwiftUI

struct Home: View {
 //   @EnvironmentObject var noteViewModel: NoteViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    Home()
}
