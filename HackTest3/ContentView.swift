//
//  ContentView.swift
//  HackTest3
//
//  Created by Christian Kim on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    @State var signInSuccess = false

    var body: some View {
        if signInSuccess {
            HomeView()
        }
        else {
            LoginFormView(signInSuccess: $signInSuccess)
        }
        
    }
}

struct LoginFormView: View {
    @Binding var signInSuccess: Bool
    @State var user: String = ""
    @State var pass: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [.init(color: Color(#colorLiteral(red: 0.5411764979362488, green: 0.7921568751335144, blue: 1, alpha: 1)), location: 0.0989583358168602),.init(color: Color(#colorLiteral(red: 0.7960784435272217, green: 0.800000011920929, blue: 1, alpha: 1)), location: 0.3958333432674408),.init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),location: 0.9739583134651184)]),startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)).edgesIgnoringSafeArea(.all)
            
            VStack() {
                Image("Group 38").padding(.top,20)
                Text("Email").font(.system(size:15,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).padding(EdgeInsets(top: 45, leading: 65, bottom: 0, trailing: 0))
                TextField("Email address", text: $user).padding(.leading,65)
                Divider().padding(EdgeInsets(top: 0, leading: 65, bottom: 0, trailing: 65))
                Text("Password").font(.system(size:15,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).padding(EdgeInsets(top: 45, leading: 65, bottom: 0, trailing: 0))
                SecureField("Password", text: $pass).padding(.leading,65)
                Divider().padding(EdgeInsets(top: 0, leading: 65, bottom: 0, trailing: 65))
                Button(action: {
                    signInSuccess = true
                }) {
                    Image("Signup")
                }.padding(.top,14)
                
                Spacer()
            }
         
        }
        
    }
}
struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [.init(color: Color(#colorLiteral(red: 0.5411764979362488, green: 0.7921568751335144, blue: 1, alpha: 1)), location: 0.0989583358168602),.init(color: Color(#colorLiteral(red: 0.7960784435272217, green: 0.800000011920929, blue: 1, alpha: 1)), location: 0.3958333432674408),.init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),location: 0.9739583134651184)]),startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)).edgesIgnoringSafeArea(.all)
            VStack() {
                HStack(alignment:.top) {
                    Image("Plane 1").padding(.top,20)
                    VStack(alignment: .trailing) {
                        Text("Hello,").font(.system(size:18,weight:.regular)).frame(maxWidth:.infinity,alignment:.trailing).foregroundColor(Color(#colorLiteral(red: 0.3, green: 0.3, blue: 0.3, alpha: 1))).padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 40))
                        Text("Justin").font(.system(size:32,weight:.bold)).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 40))
                        Image("Group 23").padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 40))
                        
                    }
                }
                ZStack {
                    Image("cloud 1").frame(maxWidth:.infinity,alignment:.trailing).padding(.bottom,-55)
                    Text("Past Trips").font(.system(size:25,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).padding(EdgeInsets(top: 45, leading: 40, bottom: 0, trailing: 0))
                }
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing:15){
                        Image("Group 29").padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                        Image("Group 22").padding(.top,2)
                        Image("Group 23 (2)").padding(.top,2)
                        Image("Group 24").padding(.top,2)
                        Image("Group 25").padding(.top,2)
                    }
                }
                Text("Recommendations").font(.system(size:25,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).padding(EdgeInsets(top: 25, leading: 40, bottom: 0, trailing: 0))
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing:15){
                        
                        ZStack(alignment:.top) {
                            Image("Group 39").padding(.leading,40)
                            HStack(alignment:.top){
                                VStack {
                                    Text("S").font(.system(size:17,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).padding(EdgeInsets(top: 40, leading: 80, bottom: 1, trailing: 0))
                                    Text("a").font(.system(size:12,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
                                }
                                ZStack {
                                    Image("Group 40").frame(maxWidth:.infinity,alignment:.trailing).padding(EdgeInsets(top: 50, leading: 80, bottom: 0, trailing: 10))
                                    Text("$146").font(.system(size:16,weight:.bold)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.56, blue: 1, alpha: 1))).padding(EdgeInsets(top: 35, leading: 77, bottom: 0, trailing: 10))
                                }
                                
                                Spacer()
                            }
                        }
                        Image("Group 31 (1)")
                        
                    }
                }
                HStack {
                    Button("Button") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }
                
                Spacer()
            }
         
        }
    }
}
struct RecView:View {
    var body: some View {
        Text("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
.previewInterfaceOrientation(.portrait)
    }
}
