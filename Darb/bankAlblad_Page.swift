//
//  bankAlblad_Page.swift
//  Darb
//
//  Created by Shahad Alkhalaf on 25/05/1444 AH.
//

import SwiftUI
import MapKit

struct bankAlblad_Page: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var body: some View {
        
        
        ZStack {
            
            Color("Color").ignoresSafeArea()
            //.ignoresSafeArea()
            
            VStack{
                
                HStack{
                    
                    Text("بنك البلاد")
                    //.navigationBarItems("بنك البلاد", displayMode: .inline)
                        .font(.largeTitle)
                        .font(.system(size: 25,weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("dark blue"))
                        .lineLimit(-8)
                        .padding(.top,-0.0)
                    
                    
                    Image("b 1")
                        .resizable()
                        .frame(width: 34.0, height: 30.0)
                        .cornerRadius(8)
                        .padding(.top,-0.0)
                    
                }
                
                          .padding(-70)
                
                
                VStack(alignment: .trailing){
                    
                    Text("شروط القبول")
                        .foregroundColor(Color("dark blue"))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20,weight: .semibold))
                        .padding(.trailing)
                    
                    Divider()
                    Text(" طالب/طالبة بكالوريوس على أن لا يقل المعدل عن 4/2.5 أو 5/3. أن يكون المتقدم سعودي/سعودية الجنسية. أن لا يكون المتقدم قد تخرج وحقق متطلبات برنامج التدريب التعاوني.يجب على المتقدم إتمام فترة التدريب كاملة. إجتياز المقابلة الشخصية.إشتراط الجامعة التدريب العملي كمتطلب للتخرج")
                    
                    
                } .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 357, height: 200)
                    .background(Color.white)
                    .cornerRadius(27)
                    .font(.system(size: 12,weight: .semibold))
                
                    .padding(17)
                
                VStack(alignment: .trailing){
                    Text("الوثائق المطلوبة")
                        .foregroundColor(Color("dark blue"))
                        .font(.system(size: 20,weight: .semibold))
                        .padding(.trailing)
                    
                    Divider()
                    
                    Text(" صورة من بطاقة الأحوال المدنية. السجل الأكاديمي.خطاب من الجامعة ينص على أن برنامج التدريب التعاوني من متطلبات التخرج مع توضيح تاريخ بداية ونهاية التدريب.")
                    
                }
                .font(.body)
                .minimumScaleFactor(0.1)
                .frame(width: 357, height: 174)
                .background(Color.white)
                .cornerRadius(27)
                .font(.system(size: 12,weight: .semibold))
                
                
                
                HStack{
                    Spacer()
                    Text("تجارب الطلاب في الجهة:")
                        .font(.title)
                        .foregroundColor(Color("dark blue"))
                        .font(.system(size: 20,weight: .semibold))
                        .padding(.horizontal,12)
                    
                    
                }
                
                
                HStack{
                    VStack(alignment: .trailing){
                        Text("نورة احمد")
                            .foregroundColor(Color("dark blue"))
                            .font(.system(size: 20,weight: .semibold))
                            .padding(.trailing)
                        
                        
                        
                        Text("تجربة مختلفة و ممتعة")
                        
                    }
                    .font(.body)
                    .minimumScaleFactor(0.1)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(27)
                    .font(.system(size: 12,weight: .semibold))
                    
                    VStack(alignment: .trailing){
                        Text("خالد فهد")
                            .foregroundColor(Color("dark blue"))
                            .font(.system(size: 20,weight: .semibold))
                            .padding(.trailing)
                        
                        
                        
                        Text("شركة رائعة و متفهمة")
                    }
                    .font(.body)
                    .minimumScaleFactor(0.1)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(27)
                    .font(.system(size: 12,weight: .semibold))
                    
                    
                    
                }
                
                HStack{
                    Spacer()
                    Text("الموقع:")
                        .font(.title)
                        .foregroundColor(Color("dark blue"))
                        .font(.system(size: 20,weight: .semibold))
                        .padding(.horizontal,12)
                }
                Map(coordinateRegion: $region)
                    .frame(width: 344, height: 74)
                Spacer()
                NavigationLink{
                    Detailsof_()
                    
                    
                    // Button("تطبيق") {
                    // }
                    
                }label: {
                    
                    Text("تطبيق")
                    
                        .frame(width: 278, height: 40)
                        .background(Color("Color 5"))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                    
                }
            }
            
            
            
        }
    } //view
    
    struct bankAlblad_Page_Previews: PreviewProvider {
        static var previews: some View {
            bankAlblad_Page()
        }
    }
    
}
