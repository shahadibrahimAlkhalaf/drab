//
//  onborarding.swift
//  Darb
//
//  Created by Shahad Alkhalaf on 25/05/1444 AH.
//



import SwiftUI

struct OnBoardingStep{
    let image: String
    let title: String
    let description: String
    
}
private let onBoardingSteps = [
           OnBoardingStep(image: "3", title: "الدرب" , description: "تقدم كافة المعلومات عن جهات التدريب التعاوني  وتسهل عملية وصول الطلاب للجهة المطلوبـــة من خلال الدرب "),
           OnBoardingStep(image: "4", title: "تحديد الجهة المناسبة لك" , description:"استعراض الجهات التدريبية لكل طالب حسب تخصصه حتى يتمكن الطالب من اختيار الجهة المناسبه له.")

           
           ]
           
           
struct onborarding: View {
    @State private var currentStep = 0
    
    var body: some View{
      
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        self.currentStep = onBoardingSteps.count - 1
                    }){
                        NavigationLink {
                            ContentView()
                        } label: {
                            Text("تخطي")
                                .padding(16)
                        }
                    }
                }
                TabView(selection: $currentStep){
                    ForEach(0..<onBoardingSteps.count) { it in
                        VStack{
                            Image(onBoardingSteps[it].image)
                                .resizable()
                                .frame(width: 600, height: 600)
                                .padding(.top, -200)
                            
                            Text(onBoardingSteps[it].title)
                                .bold()
                                .padding(.top, -100)
                                .foregroundColor(Color("dark blue"))
                            //                            .font(.largeTitle)
                                .font(.system(size:30))
                            Text(onBoardingSteps[it].description)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 30))
                                .foregroundColor(Color("dark blue"))
                            //.padding(.top, -85)
                            //.padding(.horizontal, 30)
                            // Text("تحديد الجهة المناسبة لك")
                                .bold()
                            
                            
                            
                            
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }.background(Color(#colorLiteral(red: 0.8949090242, green: 0.9346854091, blue: 0.9721284509, alpha: 1) ))
            
            
            // .foregroundColor(Color: .white)
            
        }
        
    }


struct onborarding_Previews: PreviewProvider {
    static var previews: some View{
        onborarding()
    }
}
