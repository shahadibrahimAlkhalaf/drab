//
//  AuthView.swift
//  Darb
//
//  Created by Shahad Alkhalaf on 27/05/1444 AH.
//

import SwiftUI
import PhotosUI
struct AuthView: View {
    @State var isnewUser: Bool = true
    @State var email: String = ""
    @State var pssword: String = ""
    @State var username: String = ""
    @State var profileImage : UIImage?
    @State var selection:[PhotosPickerItem] = []
    
    init() {
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = #colorLiteral(red: 0.4945337772, green: 0.5346165895, blue: 0.9742602706, alpha: 1)
        
    }
    
    var body: some View {
        NavigationView {

            ScrollView {

                
                ZStack{
                    Image("Image 8")
                        .resizable()
                        .frame(width:423.0, height:410.0)
                        .padding(.top,-180.0)
                    Image("Image 7")
                        .resizable()
                        .frame(width:310, height:240)
                        .padding(.all,-138.0)
                    
                    
                }
                                 
                
                
                Picker(selection: $isnewUser)
                {
                    
                    Text("تسجيل دخول")
                        .tag(false)
                    
                    Text("إنشاء الحساب")
                        .tag(true)
                        
                    
                } label: {
                }
                .pickerStyle(.segmented)
                        .cornerRadius(10)
                        .frame(width: 299, height: 32)
                
            
            
                
                //maxselection to select one photo
                PhotosPicker(selection: $selection,maxSelectionCount: 1 ,matching: .images, preferredItemEncoding: .automatic) {

                    
                }.padding(.top)
                //لازم نحطها عشان الصوره تظهر اللي اخترنها
                    .onChange(of: selection) { _ in
                        for item in selection {
                            Task{
                                if let data = try? await item.loadTransferable(type: Data.self){
                                    profileImage = UIImage(data: data)
                                }
                            }
                        }
                    }
            
                    .isHidden(!isnewUser, remove: !isnewUser)
                TextField("اسم المستخدم", text: $username)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                        
                           
                    }
                    .frame(width: 301, height: 33.63)
                    .padding()
                TextField("البريد الإلكتروني", text: $email)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                      
                        
                     
                    
                    }
                    .frame(width: 301, height: 33.63)
                    .padding()
                // .opacity(isnewUser ? 1 : 0)
                //best soltion2
                //  عشان نخليه ماياخذ حجم
                    .isHidden(!isnewUser, remove: !isnewUser)
                SecureField("كلمة المرور", text: $pssword)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                    }
                    .frame(width: 301, height: 33.63)
                    .padding()
                
                NavigationLink{
                    ContentView()
                   // Button {
                        
                    } label: {
                        Text(isnewUser ?"إنشاء الحساب":"تسجيل دخول")
                        // يتغير البوتون
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(width: 299, height: 50)
                            .background(Color("Color 5"))
                            .cornerRadius(10)
                        
                            .padding()
                        
                        
                        
                    }
                }
                
            }
            .animation(.spring(), value: isnewUser)
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        
                    } label: {

                    }
                    
                }
            }
        }
            
        }
    


struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
//            .preferredColorScheme(.dark)
    }
}
extension View {
   
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
