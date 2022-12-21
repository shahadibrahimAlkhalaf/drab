//
//  Detailsof .swift
//  Darb
//
//  Created by Shahad Alkhalaf on 26/05/1444 AH.
//
import SwiftUI
import iPhoneNumberField
import iTextField


struct Detailsof_: View {
    // @State var text = ""
    @State var isnewUser: Bool = true
    @State var text: String = ""
    @State var text1: String = ""
    @State var isEditing: Bool = false
    
    @State var fileContent:Data = Data()
    @State var showDocumentPicker = false
    
    var body: some View {
        

            ZStack {
                
                Color("Color").ignoresSafeArea()
                VStack(alignment: .trailing){
                    
                    
                    
                    Group {
                        Text("معلومات المتدرب")
                        
                            .font(.largeTitle)
                            .font(.system(size: 20,weight: .semibold))
                            .multilineTextAlignment(.leading)
                        //.frame(width: 184.0 , height:32.0 )
                            .foregroundColor(Color("dark blue"))
                        //.lineLimit(-8)
                            .padding(.top,0.0)
                        
                        
                        
                        Text("السجل الأكاديمي")
                            .font(.title)
                            .font(.system(size: 15,weight: .semibold))
                        
                        Button() {
                            showDocumentPicker = true
                        } label: {
                            Text("تنزيل الملف")
                                .frame(width: 100.0 , height:37.0 )
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                        .sheet(isPresented: self.$showDocumentPicker) {
                            DocumentPicker(fileContent: $fileContent)
                        }
                        
                        
                        
                        Text("ملف السجل الاكادمي مطلوب و يجب ان يكون PDF")
                            .font(.body)
                            .foregroundColor(.gray)
                            .font(.system(size: 13,weight: .semibold))
                        
                    }
                    Group {
                        Text("خطاب جامعي")
                            .font(.title)
                            .font(.system(size: 15,weight: .semibold))
                        
                        Button() {
                            showDocumentPicker = true
                        } label: {
                            Text("تنزيل الملف")
                                .frame(width: 100.0 , height:37.0 )
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                        .sheet(isPresented: self.$showDocumentPicker) {
                            DocumentPicker(fileContent: $fileContent)
                        }
                        
                        
                        Text("سيرة ذاتية")
                            .font(.title)
                            .font(.system(size: 15,weight: .semibold))
                        
                        Button() {
                            showDocumentPicker = true
                        } label: {
                            Text("تنزيل الملف")
                                .frame(width: 100.0 , height:37.0 )
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                        .sheet(isPresented: self.$showDocumentPicker) {
                            DocumentPicker(fileContent: $fileContent)
                        }
                        
                        Text("ملف السيرة الذاتية مطلوب و يجب ان يكون PDF")
                            .font(.body)
                            .foregroundColor(.gray)
                            .font(.system(size: 13,weight: .semibold))
                        
                        Text("رقم الجوال")
                            .font(.title)
                            .font(.system(size: 15,weight: .semibold))
                        
                        
                        
                        
                        
                        iPhoneNumberField("05xxxxxxxxx", text: $text)
                            .frame(width: 330, height:33.63 )
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 3)
                        // .padding(15)
                        
                        Text("يجب أن يكون بالارقام الانجليزية")
                            .font(.body)
                            .foregroundColor(.gray)
                            .font(.system(size: 18,weight: .semibold))
                        
                        Text("المعدل التراكمي")
                            .font(.title)
                            .font(.system(size: 15,weight: .semibold))
                        
                        
                    }
                    Group {
                        iTextField("xxx", text: $text1, isEditing: $isEditing)
                            .frame(width: 100.0 , height:37.0 )
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 3)
                        
                        Text("يجب أن يكون بالارقام الانجليزية تأكد من استخدام (.) بدل من (,)")
                            .font(.system(size: 13))
                            .lineLimit(2)
                            .minimumScaleFactor(0.75)
                            .foregroundColor(.gray)
                            .font(.system(size: 10,weight: .semibold))
                        
                        // .font(.system(size: 12,weight: .semibold))
                        
                        
                        
                        Text("نوع المعدل التراكمي")
                            .font(.title)
                            .font(.system(size: 15,weight: .semibold))
                        
                        
                        Picker(selection: $isnewUser) {
                            Text("من 5")
                                .tag(false)
                            Text("من 4")
                                .tag(true)
                            
                        } label: {
                        } .pickerStyle(.menu)
                            .frame(width: 100.0 , height:37.0 )
                            .background(Color.white)
                            .cornerRadius(8)
                        
                        
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    
                    HStack{
                        Button("إلغاء") {
                        }
                        .frame(width: 154, height: 45)
                        .foregroundColor(.black)
                        .background(Color("Color 2"))
                        .cornerRadius(8)
                       
                        
                        NavigationLink{
                            profile()
                        }label: {
                            //  Button("تطبيق") {
                            // }
                            Text("تطبيق")
                                .frame(width: 154, height: 45)
                                .background(Color("Color 5"))
                                .foregroundColor(.black)
                                .cornerRadius(8)
                        }
                    }
                    
                    
                }
                
            }
            
        }
    }

struct Detailsof__Previews: PreviewProvider {
    static var previews: some View {
        Detailsof_()
            .previewInterfaceOrientation(.portrait)
    }
}
struct DocumentPicker: UIViewControllerRepresentable {

    @Binding var fileContent: Data
    
    func makeCoordinator() -> DocumentPickerCoordinator {
        return DocumentPickerCoordinator(fileContent: $fileContent)
    }
    
    func makeUIViewController(context:
        UIViewControllerRepresentableContext<DocumentPicker>) ->
    UIDocumentPickerViewController {
        //The file types like ".pkcs12" are listed here:
        //https://developer.apple.com/documentation/uniformtypeidentifiers/system_declared_uniform_type_identifiers?changes=latest_minor
        let controller: UIDocumentPickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: [.pkcs12], asCopy: true)
        controller.delegate = context.coordinator
    return controller
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
        print("update")
    }
} //struct

class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate {

    @Binding var fileContent: Data
    
    init(fileContent: Binding<Data>) {
        _fileContent = fileContent
    }

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let fileURL = urls[0]
        
        let certData = try! Data(contentsOf: fileURL)
        
        if let documentsPathURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first {
            let certURL = documentsPathURL.appendingPathComponent("certFile.pfx")
            
            try? certData.write(to: certURL)
        }

    }
}
