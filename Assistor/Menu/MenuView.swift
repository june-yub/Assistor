//
//  MenuView.swift
//  Assistor
//
//  Created by Junyeop Jeon on 7/28/21.
//

/*
 Source of images :
    autopilot2 : https://www.flaticon.com/free-icon/autopilot_1972885
    crashicon3 : https://www.iconfinder.com/icons/3465610/accident_car_collision_crash_damage_traffic_vehicle_icon
    escape4 : https://icons8.com/icons/set/escape
 */


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
                        .frame(width: 130, height: 30, alignment: .leading)
                        .padding(0)
                    
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
                            .foregroundColor(.clear)
                    }
                    .padding(.horizontal,5)
                    .padding(.bottom,1)
                }
            }
            
            // Divider..
            Divider()
                .padding(.top,0)
            
            HStack
            {
                Image("autopilot2")
            
                //Spacer(minLength: 0)
                Text("Automation")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Spacer(minLength: 0)
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.down")
                        .foregroundColor(.primary)
                })
                .buttonStyle(PlainButtonStyle())
                Button(action: {}, label: {
                    Image(systemName: "trash")
                        .foregroundColor(.primary)
                    
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.bottom,4)
            
            //Bottom View..
            HStack
            {
                
                Button(action: {
                    //quit()
                },
                       label: {
                    Image("escape4")
                        .resizable()
                        //.aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30, alignment: .leading)
                        //.clipShape(Circle())
                        .font(.callout)
                        //.offset(y:2)
                        
                    Text("Quit")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        //.offset(y:2)
                })
//                .frame(width: 70, height: 30)
//                .buttonStyle(PlainButtonStyle())
                
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            //.padding(.bottom)
        }
        // Max Menu Size...
        // Your own Size...
        .frame(width: 230, height: 160)
    }
}
//func quit()
//{
//    //NSApplication.shared.terminate(AppDelegate.self)
//}

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
                                
                                .matchedGeometryEffect(id: "TAB", in: animation)
//                            if title == "On"
//                            {
//                                RoundedRectangle(cornerRadius: 4).fill(Color.blue)
//                            }
//                            else
//                            {
//                                RoundedRectangle(cornerRadius: 4).fill(Color.orange)
//                            }
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


