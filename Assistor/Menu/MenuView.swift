//
//  MenuView.swift
//  Assistor
//
//  Created by Junyeop Jeon on 7/28/21.
//

import SwiftUI

struct MenuView: View {
    // For Slide Animation
    @Namespace var animation
    // Current Tab..
    @State var currentTab = "Uploads"
    var body: some View {
        VStack
        {
            HStack
            {
                Image("crashicon3")
            VStack
            {
                
            Text("Crash Detection")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                //.frame(width: 30, height: 30, alignment: .leading)
                .padding(1)
            HStack
            {
                TabButton(title: "On",
                          currentTab: $currentTab,
                          animation: animation)
                    .frame(width: 50, height: 20)
                    
                TabButton(title: "Off",
                          currentTab: $currentTab,
                          animation: animation)
                    .frame(width: 50, height: 20)
                
                Image(systemName: "bell.fill")
            }
            //.padding(.horizontal)
            }
            }
            
            // Divider..
            Divider()
                .padding(.top,0)
            
            HStack
            {
                Text("Automation..")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.primary)
                })
            }
            
            Image("yoojung")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(30)
            
           
            
            Spacer(minLength: 15)
                
            
            Divider()
                .padding(.bottom,4)
            
            //Bottom View..
            HStack
            {
                Image("escape")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                
                Text("Quit")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        // Max Menu Size...
        // Your own Size...
        .frame(width: 230, height: 300)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct TabButton: View
{
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    var body: some View
    {
        Button(action: {
            withAnimation
            {
                currentTab = title
                
            }
        }, label: {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                //For Dark Mode Adoption
                .foregroundColor(currentTab == title ? .white: .primary)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity)
                
                .background(
                    ZStack
                    {
                        if currentTab == title
                        {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                                
                        }
                        else
                        {
                            //Primary Bar
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.primary, lineWidth:0.6)
                        }
                    }
                )
                .contentShape(RoundedRectangle(cornerRadius: 4))
        })
        .buttonStyle(PlainButtonStyle())
    }
}
