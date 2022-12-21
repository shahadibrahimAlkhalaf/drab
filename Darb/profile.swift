//
//  profile.swift
//  Darb
//
//  Created by Shahad Alkhalaf on 26/05/1444 AH.
//

import SwiftUI


let comapnies = [company(companyimage: "stc 1", companyname: "الاتصالات السعوديه" , stats:"ملغي", cimage:"Image 2"), company(companyimage: "bank", companyname: " بنك البلاد", stats:"تحت الاجراء" , cimage:"Image 3"), company(companyimage: "Image2", companyname: "هيئة السوق المالية", stats:"تم قبول الطلب"  , cimage:"Image 4" ), company(companyimage: "ثقه", companyname: " ثقه", stats: "ملغي" , cimage:"Image 2" ) ]


struct profile: View {
    init() {
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = #colorLiteral(red: 0.4941176471, green: 0.5333333333, blue: 0.9725490196, alpha: 1)
    }
    
    
    @State var segmentedChoice = 0

 
    var body: some View {
        
            VStack {
                
                    
                    HStack{
                        
                        
                        Spacer()
                        Image("Image1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black,lineWidth: 2))
                        Spacer()
                        
                        

                          
                        
                        
                       
                       
                    }

                    VStack {
                        Picker("", selection: $segmentedChoice){
                            Text("تقديماتي").tag(0)
                            Text("صفحتي").tag(1)
                        }
                       
                        
                        .padding()
                        .pickerStyle(SegmentedPickerStyle())
                        .foregroundColor(Color.blue)
                        if(segmentedChoice == 0){
                            Applyfor()
                        }
                        if(segmentedChoice == 1){
                            mypage()
                        }
                    }
                
                    
                
                
                
            } .background(Color("lightblue"))
            

        
    }


    
    }

struct Applyfor : View {
    @State var segmentedChoice = 0
    
    var body: some View {
        
        

        
        ScrollView{
            

                    ForEach(comapnies) { comapny in
                        VStack(alignment: .trailing){
                            
                        HStack{
                            
                            HStack{
                          
                                Text(comapny.stats)
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                    .ignoresSafeArea()
                                Image(comapny.cimage)
                            }.padding(.top , 50)
                                .padding(.horizontal)
//
                          
                              Spacer()
                                
                                Text(comapny.companyname)
                              
                                    .bold()
                                    .font(.system(size: 16))
                                 
                           
                                Image(comapny.companyimage)
                                    .resizable()
                                    .frame(width: 70.0, height: 70.0)
                                
                      
                            }
                        Divider()
                            
                        
//
                                
                            
                                
                                
                            
                       
                              
                        }
                        
  
            }
            .listStyle(.plain)
        }

            .background(Color.white)
           
           




    }


        }
   
    //page 2
struct mypage : View {
    @State var segmentedChoice = 0
    @State var FirstName: String = ""
    @State var Lastname : String = ""
    @State var Email : String = ""
    @State var Location : String = ""
    @State var Filed : String = ""
    @State var Major : String = ""
    
    var body: some View {
 
        VStack{

       
                Text("معلومات عامه")

            
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    
                 .foregroundColor(Color(#colorLiteral(red: 0.0704760626, green: 0.04614608735, blue: 0.4175766408, alpha: 1)))
                
                    .padding(.top,20)
                    .padding(.leading, 250)
                
                Spacer()
 

            
            ScrollView{
                VStack{
                    TextField("الأسم الأول", text: $FirstName)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)

                                    }
                                    .frame(width: 350, height: 30.63)
                                    .padding()
                    
                    TextField("الاسم الاخير", text: $Lastname)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)

                                    }
                                    .frame(width: 350, height: 30.63)
                                    .padding()
                    
                    TextField("البريد الإلكتروني", text: $Email)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)

                                    }
                                    .frame(width: 350, height: 30.63)
                                    .padding()
                    
                    TextField("موقعك الحالي", text: $Location)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)

                                    }
                                    .frame(width: 350, height: 30.63)
                                    .padding()
                    
                    TextField("المؤهل", text: $Filed)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)

                                    }
                                    .frame(width: 350, height: 30.63)
                                    .padding()
                    
                    TextField("التخصص", text: $Major)
                    .multilineTextAlignment(.trailing)
                    .padding()
                    .overlay {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)

                                    }
                                    .frame(width: 350, height: 30.63)
                                    .padding()
              
                    
                    Button("تطبيق") {
                        
                    }
                    .frame(width: 275, height: 50)
                    .background(Color("appBlue"))
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    
                   
                }
                
             
            }.padding(.top,10)
                
            
            
        } .background(Color.white)
    }
    
    
    
}


struct profile_Previews: PreviewProvider {
    static var previews: some View {
        profile()

        
    }
}


struct company: Identifiable{
    var id = UUID()
    var companyimage: String
    var companyname: String
    var stats: String = ""
    var cimage: String

    
}
