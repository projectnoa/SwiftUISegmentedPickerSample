//
//	ContentView.swift
//  SwiftUISegmentedControlSample
//
//  Created by Juan Mueller on 12/6/22.
//  For more, visit www.ajourneyforwisdom.com
//

import SwiftUI

struct ContentView: View {
    @State private var choice = ""
    var starters = ["Bulbasaur", "Charmander", "Squirtle"]
    
    init() {
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = .red
        UISegmentedControl.appearance()
            .setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        UISegmentedControl.appearance()
            .setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }

    var body: some View {
        VStack {
            Text("Choose your starter!")
                .font(.largeTitle)
                .bold()
            
            Image(choice)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 50)
            
            Text(choice)
                .font(.largeTitle)
                .bold()
                .foregroundColor(typeColorOf(choice))
                .accessibilityIdentifier("starterName")
            
            HStack {
                Image(checkIs(starters[0]))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(isPicked(starters[0]))
                    .onTapGesture {
                        choice = starters[0]
                    }
                    .accessibilityIdentifier("starter1")
                Image(checkIs(starters[1]))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(isPicked(starters[1]))
                    .onTapGesture {
                        choice = starters[1]
                    }
                    .accessibilityIdentifier("starter2")
                Image(checkIs(starters[2]))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(isPicked(starters[2]))
                    .onTapGesture {
                        choice = starters[2]
                    }
                    .accessibilityIdentifier("starter3")
            }
            
            Picker("Choose your starter",
                   selection: $choice) {
                ForEach(starters, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .cornerRadius(50)
            .accessibilityIdentifier("starterPicker")

            if starters.contains(choice) {
                Text(dexEntryOf(choice))
                    .font(.subheadline)
                    .accessibilityIdentifier("dexEntry")
            }
        }.padding(20)
    }
    
    func isPicked(_ pokemon: String) -> CGFloat {
        return choice == pokemon ? 1 : 20
    }
    
    func typeColorOf(_ pokemon: String) -> Color {
        switch pokemon {
        case starters[0]:
            return .green
        case starters[1]:
            return .red
        case starters[2]:
            return .blue
        default:
            return .black
        }
    }
    
    func checkIs(_ pokemon: String) -> String {
        if pokemon == choice {
            return "Pokeball"
        } else {
            return "Pokeball Grey"
        }
    }
    
    func dexEntryOf(_ pokemon: String) -> String {
        switch pokemon {
        case starters[0]:
            return "Bulbasaur. It bears the seed of a plant on its back from birth. The seed slowly develops. Researchers are unsure whether to classify Bulbasaur as a plant or animal. Bulbasaur are extremely tough and very difficult to capture in the wild."
        case starters[1]:
            return "Charmander. A flame burns on the tip of its tail from birth. It is said that a Charmander dies if its flame ever goes out."
        case starters[2]:
            return "Squirtle. This Tiny Turtle Pokémon draws its long neck into its shell to launch incredible Water attacks with amazing range and accuracy. The blasts can be quite powerful."
        default:
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
