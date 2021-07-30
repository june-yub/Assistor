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
                Text("Debug Mode")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                TabButton(title: "On",
                          currentTab: $currentTab,
                          animation: animation)
                    .frame(width: 50, height: 20)
                
                TabButton(title: "Off",
                          currentTab: $currentTab,
                          animation: animation)
                    .frame(width: 50, height: 20)
            }
            //.padding(.horizontal)
            .padding(.top)
            
            // Divider..
            Divider()
                .padding(.top,0)
            
            Image("yoojung")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(30)
            
            HStack
            {
                Text("Export your artboards....")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.primary)
                })
            }
            
            Spacer(minLength: 15)
                
            
            Divider()
                .padding(.bottom,4)
            
            //Bottom View..
            HStack
            {
                Image("drwatsonbb")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                
                Text("iJustine")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "gear")
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
                            //Primary Bor
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
