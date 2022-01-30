//
//  ContentView.swift
//  HackTest3
//
//  Created by Christian Kim on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    @State var signInSuccess = false
    @State var recommendation = Recommendation()
    @State var showingProfile = false
    @State var showingHome = false
    @State var showingHome2 = false
    @State var showingRec = false
    var body: some View {
        if showingHome2 {
            HomeView(recommendation: $recommendation, showingProfile: $showingProfile,showingRec: $showingRec)
        }
        else if showingProfile {
            ProfileView(showingHome2: $showingHome2)
        }
        else if showingHome2 {
            HomeView(recommendation: $recommendation, showingProfile: $showingProfile,showingRec: $showingRec)
        }
        else if showingHome {
            HomeView(recommendation: $recommendation, showingProfile: $showingProfile,showingRec: $showingRec)
        }
        else if showingRec {
            RecView(showingHome: $showingHome)
        }
        else if signInSuccess {
            HomeView(recommendation: $recommendation, showingProfile: $showingProfile,showingRec: $showingRec)
        }
        else {
            LoginFormView(signInSuccess: $signInSuccess,recommendation: $recommendation)
        }
        
    }
}

struct LoginFormView: View {
    @Binding var signInSuccess: Bool
    @State var user: String = ""
    @State var pass: String = ""
    
    @Binding var recommendation:Recommendation
    func get_rec() {
        let url = URL(string: "https://qjc-nodeserver.herokuapp.com/user/recommendation")

        let session = URLSession.shared
        let task = session.dataTask(with: url!) {(data, response, error) in
            if error == nil && data != nil {
                // parse JSON
                let decoder = JSONDecoder()
                do {
                    let rec = try decoder.decode(Recommendation.self, from: data!)
                    recommendation.price = rec.price
                    recommendation.origin = rec.origin
                    recommendation.destination = rec.destination
                    recommendation.date = rec.date
                    print("done")
                }
                catch {
                    print("error in parsing Recommendation JSON")
                }
            }
        }
        
        task.resume()
    }
    
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
                    get_rec()
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
    @State var test = "Hello"
    @Binding var recommendation:Recommendation
    @Binding var showingProfile: Bool
    @Binding var showingRec: Bool
    
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
                        Image("Group 42").padding(.top,2)
                        Image("Group 43").padding(.top,2)
                    }
                }
                Text("Recommendations").font(.system(size:25,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).padding(EdgeInsets(top: 25, leading: 40, bottom: 0, trailing: 0))
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing:15){
                        
                        ZStack(alignment:.top) {
                    
                            
                            Image("Group 31 (4)").padding(.leading,40)
                            Button(action: {
                                if showingRec {
                                    showingRec = false
                                }
                                else {
                                    showingRec = true
                                }
                            }) {
                                Image("Group 31 (4)").padding(.leading,40).opacity(0)
                            }
                        }
//                            HStack(alignment:.top){
//                                VStack {
//
//                                    Text("\(recommendation.destination?.city ?? "NIL") (\(recommendation.destination?.code ?? "NIL"))").font(.system(size:17,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).padding(EdgeInsets(top: 40, leading: 80, bottom: 1, trailing: 0))
//                                    Text("From \(recommendation.origin?.city ?? "NIL") (\(recommendation.origin?.code ?? "NIL"))").font(.system(size:12,weight:.semibold)).frame(maxWidth:.infinity,alignment:.leading).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 0))
//                                }
//                                ZStack {
//                                    Image("Group 40").frame(maxWidth:.infinity,alignment:.trailing).padding(EdgeInsets(top: 50, leading: 80, bottom: 0, trailing: 10))
//                                    Text("$\(recommendation.price ?? 0.0)").font(.system(size:16,weight:.bold)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.56, blue: 1, alpha: 1))).padding(EdgeInsets(top: 35, leading: 77, bottom: 0, trailing: 10))
//                                }
//
//                                Spacer()
//                            }
                        Image("Group 44 (1)")
                        Image("Group 46")
                        Image("Group 3133")
                        
                        
                        
                    }
                }
                HStack(spacing:30) {
                    Button(action: {
                        print("hi")
    //                    if showingProfile {
    //                        showingProfile = false
    //                    }
    //                    else {
    //                        showingProfile = true
    //                    }
                    }) {
                        Image("notebook 1 (1)").padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    }
                    Button(action: {
    //                    if showingProfile {
    //                        showingProfile = false
    //                    }
    //                    else {
    //                        showingProfile = true
    //                    }
                    }) {
                        Image("Daco_1839350 1").padding(EdgeInsets(top: 10, leading: 0, bottom: -25, trailing: 0))
                    }
                    Button(action: {
                        if showingProfile {
                            showingProfile = false
                        }
                        else {
                            showingProfile = true
                        }
                    }) {
                        Image("Group 19 (1)").padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 0))
                    }
                }
                
                Spacer()
            }
         
        }
    }
}
struct RecView:View {
    @Binding var showingHome: Bool
    var body: some View {
        ZStack(alignment:.top) {
            LinearGradient(gradient: Gradient(stops: [.init(color: Color(#colorLiteral(red: 0.5411764979362488, green: 0.7921568751335144, blue: 1, alpha: 1)), location: 0.0989583358168602),.init(color: Color(#colorLiteral(red: 0.7960784435272217, green: 0.800000011920929, blue: 1, alpha: 1)), location: 0.3958333432674408),.init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),location: 0.9739583134651184)]),startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)).edgesIgnoringSafeArea(.all)
            Image("Group 41-1").padding(.top,30)
            VStack{
                Button(action: {
                    if showingHome {
                        showingHome = false
                    }
                    else {
                        showingHome = true
                    }
                }){
                    Image("icons8-left-48").frame(maxWidth:.infinity,alignment:.leading).padding(EdgeInsets(top: 25, leading: 25, bottom: 0, trailing: 0))
                }
                Link(destination: URL(string: "https://www.google.com/docs/about/")!) {
                    Image("Group 47").padding(EdgeInsets(top: 730, leading: 220, bottom: 0, trailing: 0))
                }

            }
                        
        }
    }
}

struct ProfileView: View {
    @Binding var showingHome2: Bool
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(stops: [.init(color: Color(#colorLiteral(red: 0.5411764979362488, green: 0.7921568751335144, blue: 1, alpha: 1)), location: 0.0989583358168602),.init(color: Color(#colorLiteral(red: 0.7960784435272217, green: 0.800000011920929, blue: 1, alpha: 1)), location: 0.3958333432674408),.init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),location: 0.9739583134651184)]),startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)).edgesIgnoringSafeArea(.all)
            Button(action: {
                if showingHome2 {
                    showingHome2 = false
                }
                else {
                    showingHome2 = true
                }
            }){
                Image("icons8-left-48").frame(maxWidth:.infinity,alignment:.leading).padding(EdgeInsets(top: 25, leading: 25, bottom: 0, trailing: 0))
            }
            VStack() {
                
                Text("Profile").font(.system(size:25,weight:.semibold)).frame(maxWidth:.infinity,alignment:.top).padding(EdgeInsets(top: 150, leading: 0, bottom: 0, trailing: 0))
                
                ZStack(alignment:.top) {
                    //Rectangle 18
                    RoundedRectangle(cornerRadius: 27)
                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(width: 348, height: 403)
                    
                    VStack(alignment:.leading) {
                        Image("Face").padding(EdgeInsets(top: 40, leading: 170, bottom: 0, trailing: 0))
                            
                        
                        //Name
                        Text("Name").frame(maxWidth:.infinity,alignment:.leading).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))).padding(EdgeInsets(top: 10, leading: 80, bottom: 0, trailing: 0))
                        
                        //Justin Smart
                        Text("Justin Smart").font(.custom("Open Sans Regular", size: 15))
                            .padding(EdgeInsets(top: 1, leading: 80, bottom: 0, trailing: 0))
                        
                        // Email
                        Text("Email").frame(maxWidth:.infinity,alignment:.leading).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))).padding(EdgeInsets(top: 20, leading: 80, bottom: 0, trailing: 0))
                        
                        //guest@gmail.com
                        Text("guest@gmail.com").font(.custom("Open Sans Regular", size: 15))
                            .padding(EdgeInsets(top: 1, leading: 80, bottom: 0, trailing: 0))
                        
                        HStack {
                            VStack {
                                // Past Trips
                                Text("Past Trips").frame(maxWidth:200,alignment:.leading).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))).padding(EdgeInsets(top: 20, leading: 80, bottom: 0, trailing: 0))
                                
                                //guest@gmail.com
                                Text("5").font(.custom("Open Sans Regular", size: 15))
                                    .padding(EdgeInsets(top: 1, leading: 20, bottom: 0, trailing: 0))
                            }
                            
                            VStack {
                                // Past Trips
                                Text("Planned Trips").frame(maxWidth:200,alignment:.leading).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))).padding(EdgeInsets(top: 20, leading: 40, bottom: 0, trailing: 0))
                                
                                //guest@gmail.com
                                Text("1").font(.custom("Open Sans Regular", size: 15))
                                    .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 45))
                            }
                        }
                    }
                    
                }
                Spacer()
            }
         
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
