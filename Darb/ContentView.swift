//
//  ContentView.swift
//  Darb
//
//  Created by Shahad Alkhalaf on 13/05/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("shouldshowonboarding") var shouldshowonboarding: Bool = true
    
    // @State var isCancel12 :Bool = false
    @State var companies: [Company] = [Company.companyExample, Company.companyExample2,Company.companyExample3,Company.companyExample4,Company.companyExample5,Company.companyExample6//Company.companyExample7]
    ]
    @State var educationalQualification: Int = 3
    @State var selectedCategory: String = ""
    
    @State var showModal: Bool = false
    @State private var searchText = ""
    @State private var showingSheet = false
    

    var searchResults: [Company] {
        if selectedCategory == "الكل"{
            return companies
        }
        else if selectedCategory == "إدارة الأعمال والاقتصاد" {
            //            return companies
   //         var array = companies.filter{$0.category.contains(selectedCategory)
//                return array.filter{$0.EducationalQualification == "دبلوم"
//1
            return companies.filter{$0.category.contains(selectedCategory)

            }


        }
        else if selectedCategory == "العلوم البيولوجية والحيوية" && educationalQualification == 1{
            //            return companies
            return companies.filter{$0.category.contains(selectedCategory) && $0.EducationalQualification == "دبلوم"

            }
        }
        else if selectedCategory == "القانون والمهام الحكومية" && educationalQualification == 0{
            //            return companies
            return companies.filter{$0.category.contains(selectedCategory) && $0.EducationalQualification == "بكالوريس"

            }
        }

        else if selectedCategory == "الرياضيات والإحصاء"{
            //            return companies
            return companies.filter{$0.category.contains(selectedCategory)

            }
        }
        else if selectedCategory == "الهندسة"{
            //            return companies
            return companies.filter{$0.category.contains(selectedCategory)

            }
        }
       else if educationalQualification == 0 {
            return companies.filter{$0.EducationalQualification == "بكالوريس"}
        }
        else if educationalQualification == 1{
            return companies.filter{$0.EducationalQualification == "دبلوم"}
        }

        else if searchText.isEmpty {
            return companies
        } else {
            return companies.filter { $0.name.contains(searchText)}
        }

        return companies
    }

    var body: some View {
        if shouldshowonboarding{
            onborarding()
                .onAppear{
                    shouldshowonboarding = false
                }
        }
        else{
            NavigationView {
                
                ZStack{
                    
                    Color("Color")
                        .ignoresSafeArea()
                    
                    
                        .navigationBarItems(trailing: HStack{
                            Text("التدريب التعاوني") .font(.system(size: 21,weight: .bold)).foregroundColor(Color("dark blue")).padding(.trailing, 30)
                            Button(action: {self.showModal = true}) {
                                Image(systemName: "person.circle")
                                    .padding(.bottom)
                                //.font(.system(size: 45))
                                    .font(.system(size: 40,weight: .semibold))
                              
                                    .foregroundColor(Color("dark blue"))
                              
                            }
                        }
                        )
                    
                        .searchable(text: $searchText)
                    
                    VStack{
                        
                        HStack {
                            VStack(alignment: .leading) {
                                
                            }
                            
                            Spacer()
                            
                            
                        }
                        Spacer()
                    }
                    
                    VStack{
                        HStack{
                            Button(action: { showingSheet.toggle()}) {
                                Image(systemName: "slider.horizontal.3")
    //                                .padding(.bottom)
                                //.font(.system(size: 45))
                                    .font(.system(size: 21,weight: .semibold))
                                    .foregroundColor(Color("dark blue"))
                            }
                            
                            
                            .sheet(isPresented: $showingSheet) {
                                SheetView(educationalQualification: $educationalQualification,selectedCategory:$selectedCategory )
                                    .presentationDetents([.fraction(0.66)])
                                    .presentationDragIndicator(.visible)
                            }
                            .padding(.horizontal,8)
                            Spacer()
                            Text("التوصيات")
                                .font(.system(size: 21,weight: .bold))
                                .foregroundColor(Color("dark blue"))
                            
                                .padding(.horizontal,8)
                            
                            
                        }
                        
                        
                        ScrollView{
                            ForEach(searchResults) { company in
                                CompanyView(company: company)
                                
                            }
                            
                            //                    CompanyView()
                            //                    CompanyView()
                            
                            //                        VStack{
                            //                            HStack{
                            //                                VStack{
                            //                                    HStack{
                            //                                        Text("2.5")
                            //                                            .font(.system(size: 12,weight: .regular))
                            //                                        Image(systemName: "location")
                            //                                            .foregroundColor(Color("dark blue"))
                            //                                            .font(.system(size: 14,weight: .regular))
                            //                                        .padding(.trailing)}
                            //                                    Image("b")
                            //
                            //
                            //                                        .frame(width: 80, height: 48)
                            //
                            //                                        .padding()
                            //                                }
                            //                                VStack(alignment: .trailing) {
                            //                                    Text("بنك البلاد")
                            //                                        .font(.system(size: 16,weight: .bold))
                            //                                        .foregroundColor(Color("dark blue"))
                            //
                            //                                    Text("بنك البلاد هو مصرف إسلامي ســـعودي، يقدم  خدمات مصرفية وفق أسس شرعية يتبعها في كل المنتجـــات والخدمـــات ويوفر حلول واســـعة للعديد مـــن المجالات ")
                            //                                        .font(.system(size: 12,weight: .regular))
                            //
                            //
                            //
                            //                                }.padding(.horizontal,8)
                            //
                            //                            }
                            //
                            //
                            //                        }
                            //                        .modifier(reqtangleModifir())
                            //
                            //                        VStack{
                            //                            HStack{
                            //                                VStack{
                            //                                    HStack{
                            //                                        Text("3.1")
                            //                                            .font(.system(size: 12,weight: .regular))
                            //                                        Image(systemName: "location")
                            //                                            .foregroundColor(Color("dark blue"))
                            //                                            .font(.system(size: 14,weight: .bold))
                            //                                        .padding(.trailing)}
                            //                                    Image("صصص")
                            //
                            //
                            //                                        .frame(width: 83, height: 41)
                            //
                            //                                        .padding()
                            //                                }
                            //                                VStack(alignment: .trailing) {
                            //                                    Text("هيئة السوق المالية")
                            //                                        .font(.system(size: 16,weight: .bold))
                            //                                        .foregroundColor(Color("dark blue"))
                            //
                            //                                    Text("تولى الهيئة الإشـــراف على تنظيم وتطوير الســـوق المالية، وإصدار اللوائح والقواعد والتعليمات اللازمة لتطبيق أحكام نظام الســـوق الماليـــة ")
                            //
                            //
                            //                                        .font(.system(size: 12,weight: .regular))
                            //
                            //                                }.padding(.horizontal,8)
                            //
                            //
                            //
                            //                            }
                            //                        }
                            //                        .modifier(reqtangleModifir())
                            //
                            //
                            //                        VStack{
                            //                            HStack{
                            //
                            //                                VStack{
                            //                                    HStack{
                            //                                        Text("3.6")
                            //                                            .font(.system(size: 12,weight: .regular))
                            //                                        Image(systemName: "location")
                            //                                            .foregroundColor(Color("dark blue"))
                            //                                            .font(.system(size: 14,weight: .regular))
                            //                                        .padding(.trailing)}
                            //                                    Image("ثقه")
                            //
                            //
                            //                                        .frame(width: 83, height: 41)
                            //
                            //                                        .padding()
                            //                                }
                            //
                            //                                VStack(alignment: .trailing) {
                            //                                    Text("شركة ثقه")
                            //                                        .font(.system(size: 16,weight: .bold))
                            //                                        .foregroundColor(Color("dark blue"))
                            //
                            //                                    Text("تركز شركة ثقه على بناء علاقات راسخة وممتدة مع عملائها، وتعمل ضمن شراكات بغرض تطوير منهج عمل مشترك.")
                            //
                            //                                        .font(.system(size: 12,weight: .regular))
                            //
                            //
                            //
                            //
                            //                                }.padding(.horizontal,8)
                            //
                            //
                            //                            }
                            //                        }
                            //                        .modifier(reqtangleModifir())
                            
                        }
                        
                        
                        //                                    Button("Show Sheet") {
                        //                                        showingSheet.toggle()
                        //                                    }
                        //                                    .sheet(isPresented: $showingSheet) {
                        //                                        SheetView()
                        ///
                        ///}
    //                    Button(action: { showingSheet.toggle()}) {
    //                        Image(systemName: "slider.horizontal.3")
    //                            .padding(.bottom)
    //                        //.font(.system(size: 45))
    //                            .font(.system(size: 21,weight: .semibold))
    //                            .foregroundColor(Color("dark blue"))
    //                    }
    //
    //
    //                    .sheet(isPresented: $showingSheet) {
    //                        SheetView(educationalQualification: $educationalQualification,selectedCategory:$selectedCategory)
    //                            .presentationDetents([.fraction(0.66)])
    //                            .presentationDragIndicator(.visible)
    //                    }
                    }
                    
                }
            }.navigationBarBackButtonHidden()

        }
    }}





struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var educationalQualification: Int
    @State var isnewOption: Bool = true
    @Binding var selectedCategory: String
   // @Binding var searchResults: String
    @State var isLoading: Bool = false
    
    var body: some View {
        
        Button("") {
            
        }
        Spacer()
        HStack{
            Spacer()
            Text("التخصصات")
                .font(.system(size: 21,weight: .bold))
                .foregroundColor(Color("dark blue"))
                .padding()
        }
        VStack{
            
            HStack{
                
                Button(
                    action: {
                        selectedCategory = "العلوم البيولوجية والحيوية"
                        
                    },
                    label: {
                        Text("العلوم البيولوجية والحيوية")
                            .frame(width: 150, height: 32)
                            .foregroundColor(Color("dark blue"))
                            .background(Color("Color 1"))
                            .cornerRadius(13)
                            .shadow(radius: 2.4)
                    }
                )
                Button(
                    action: {
                        selectedCategory = "إدارة الأعمال والاقتصاد"
                    },
                    label: {
                        Text("إدارة الأعمال والاقتصاد")
                            .frame(width: 150, height: 32)
                            .foregroundColor(Color("dark blue"))
                            .background(Color("Color 1"))
                            .cornerRadius(13)
                            .shadow(radius: 2.4)
                    }
                )
                
                Button(
                    action: {
                        selectedCategory = "الكل"
                    },
                    label: {
                        Text("الكل")
                            .frame(width: 37, height: 32)
                            .foregroundColor(Color("dark blue"))
                            .background(Color("Color 1"))
                            .cornerRadius(13)
                            .shadow(radius: 2.4)
                    }
                )
            }
            
            HStack{
                Button(
                    action: {
                        selectedCategory = "الهندسة"
                    },
                    label: {
                        Text("الهندسة")
                            .frame(width: 70, height: 32)
                            .foregroundColor(Color("dark blue"))
                            .background(Color("Color 1"))
                            .cornerRadius(13)
                            .shadow(radius: 2.4)
                    }
                )
                Button(
                    action: {
                        selectedCategory = "الرياضيات والإحصاء"
                    },
                    label: {
                        Text("الرياضيات والإحصاء")
                            .frame(width: 110, height: 32)
                            .foregroundColor(Color("dark blue"))
                            .background(Color("Color 1"))
                            .cornerRadius(13)
                            .shadow(radius: 2.4)
                    }
                )
                Button(
                    action: {
                        selectedCategory = "القانون والمهام الحكومية"
                    },
                    label: {
                        Text("القانون والمهام الحكومية")
                            .frame(width: 150, height: 32)
                            .foregroundColor(Color("dark blue"))
                            .background(Color("Color 1"))
                            .cornerRadius(13)
                            .shadow(radius: 2.4)
                    }
                )
            }
            HStack{
                
                Text("علم النفس وسلوك الإنسان")
                    .frame(width: 150, height: 32)
                    .foregroundColor(Color("dark blue"))
                    .background(Color("Color 1"))
                    .cornerRadius(13)
                    .shadow(radius: 2.4)
                Text("الفنون والتصميم")
                    .frame(width: 120, height: 32)
                    .foregroundColor(Color("dark blue"))
                    .background(Color("Color 1"))
                    .cornerRadius(13)
                    .shadow(radius: 2.4)
                Text("الرياضة")
                    .frame(width: 70, height: 32)
                    .foregroundColor(Color("dark blue"))
                    .background(Color("Color 1"))
                    .cornerRadius(13)
                    .shadow(radius: 2.4)
            }
        }.font(.system(size: 12,weight: .bold))
            .padding(3)
        
        HStack{
            Spacer()
            Text("المؤهل التعليمي")
                .font(.system(size: 21,weight: .bold))
                .foregroundColor(Color("dark blue"))
                .padding()
        }
        Picker(selection: $educationalQualification) {
            Text("بكالوريس")
                .tag(0)
                .font(.system(size: 21,weight: .bold))
                .foregroundColor(Color("dark blue"))
            Text("دبلوم")
                .tag(1)
                .font(.system(size: 21,weight: .bold))
                .foregroundColor(Color("dark blue"))
        } label: {
        }
        .pickerStyle(.inline)
        
        HStack{
            Button {
                
                dismiss()
                
            } label: {
                Text("الغاء")
            }
            .frame(width: 154, height: 50)
            .background(Color("Color 1"))
            .cornerRadius(10)
            .foregroundColor(Color.black)
            .font(Font.body.bold())
            Button {
                
               
                
                dismiss()
                
            } label: {
                Text("تطبيق")
                
            }
            .frame(width: 154, height: 50)
            .background(Color("Color 5"))
            .cornerRadius(10)
            .foregroundColor(.black)
            .font(Font.body.bold())
            
            
            
        }
        //.buttonStyle(.bordered)
        //   .foregroundColor(Color("dark blue"))
        //   .background(Color("Color 1"))
        //.tint(applyTint ? .mint : .primary)
        
    }
}
    
    
    struct reqtangleModifir :ViewModifier {
        func body(content: Content) -> some View {
            NavigationLink(){
                bankAlblad_Page()
            } label: {
                
                
                content
                    .frame(width: 348, height: 133)
                    .foregroundColor(.gray)
                    .background(Color.white)
                    .cornerRadius(27)
                    .shadow(radius: 2.4)
                
                
                
                
            }}
        
        
        
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    struct Company: Identifiable{
        let id = UUID().uuidString
        let name: String
        let describtion: String
        let imagename: String
        let ditance: Float
        let category:[String]
        let EducationalQualification: String
        static let companyExample: Company = .init(name: "الاتصالات",
                                                   describtion: " شرعية يتبعها في كل المنتجـــات والخدمـــات ويوفر حلول واســـعة للعديد مـــن المجالات ",
                                                   imagename:"stc",
                                                   ditance: 1.5,
                                                   category:["الكل"],
                                                   EducationalQualification:"بكالوريس")
       
        static let companyExample2: Company = .init(name: "بنك البلاد",
                                                    describtion: "بنك البلاد هو مصرف إسلامي سعودي، يقدم  خدمات مصرفية وفق أسس شرعية يتبعها في كل المنتجات والخدمات ويوفر حلول واسعة للعديد من المجالات. ",
                                                    imagename:"b",
                                                    ditance: 2.5,
                                                    category:["إدارة الأعمال والاقتصاد"],
                                                    EducationalQualification:"بكالوريس")
        static let companyExample3: Company = .init(name: "هيئة السوق المالية",
                                                    describtion: "تولى الهيئة الإشـــراف على تنظيم وتطوير الســـوق المالية، وإصدار اللوائح والقواعد والتعليمات اللازمة لتطبيق أحكام نظام الســـوق الماليـــة ",imagename:"jjj"
                                                    ,ditance: 3.1,
                                                    category:["العلوم البيولوجية والحيوية"]
                                                    ,EducationalQualification:"دبلوم")
        static let companyExample4: Company = .init(name:"شركة ثقه",
                                                    describtion: "تركز شركة ثقه على بناء علاقات راسخة وممتدة مع عملائها، وتعمل ضمن شراكات بغرض تطوير منهج عمل مشترك. "
                                                    ,imagename:"ثقه",
                                                    ditance: 3.6,
                                                    category:["القانون والمهام الحكومية"],
                                                    EducationalQualification:"بكالوريس")
        static let companyExample5: Company = .init(name:"وزارة الاتصال وتقنية المعلومات",
                                                    describtion: "وزارة الاتصال وتقنية  المعلومات السعودية هي الوزارة المسؤولة عن جميع وسائل الاتصال في المملكة العربية السعودية "
                                                    ,imagename:"mm"
                                                    ,ditance: 3.6
                                                    ,category:["الرياضيات والإحصاء"]
                                                    ,EducationalQualification:"بكالوريس")
        static let companyExample6: Company = .init(name:"وزارة النقل",
                                                    describtion:"تعمل وزارة النقل والخدمات اللوجستية على دراسة وتصميم وتنفيذ أعمال الطرق وصيانتها بكفاءة، كما تشارك في تنسيق أعمال منظومة النقل والخدمات اللوجستية."
                                                    ,imagename:"t"
                                                    ,ditance: 2.5
                                                    ,category:["الهندسة"]
                                                    ,EducationalQualification:"دبلوم")
        //     static let companyExample7: Company = .init(name:"وزارة الصحة", describtion:"مستشفى الإيمان العام كان الاهتمام بالصحة العامة ومكافحة الأمراض من أولويات الحكومة السعودية منذ البدايات الأولى لتوحيد المملكة وبناء الدولة السعودية الحديثة. ",imagename:"وزارة الصحه",ditance: 1.9)
        //        static let companyExample8: Company = .init(name:"هيئة الزكاة والضريبة والجمارك", describtion:"الهيئة العامة للزكاة والدخل هي إحدى الجهات الحكومية السعودية السابقة كانت ترتبط تنظيميا بوزير المالية.  ",imagename:"هيئة الزكاة",ditance: 1.9)
        
        
    }
    
    
struct CompanyView: View {
    let company: Company
    
    var body: some View {
      
                
                VStack{
                    HStack{
                        
                        VStack{
                            
                            HStack{
                                Text("1.5")
                                    .font(.system(size: 12,weight: .regular))
                                Image(systemName: "location")
                                    .foregroundColor(Color("dark blue"))
                                    .font(.system(size: 14,weight: .bold))
                                .padding(.trailing)}
                            Image(company.imagename)
                            
                            
                                .frame(width: 83, height: 41)
                            
                                .padding()
                            
                        }
                        VStack(alignment: .trailing) {
                            Text(company.name)
                                .font(.system(size: 16,weight: .bold))
                                .foregroundColor(Color("dark blue"))
                            
                            Text(company.describtion)
                            
                                .font(.system(size: 12,weight: .regular))
                            
                            
                            
                            
                        }.padding(.horizontal,8)
                        
                    }
            }
        
            .modifier(reqtangleModifir())
        }
    }

    


