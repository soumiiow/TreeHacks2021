//
//  ContentView.swift
//  CovidSymptomTracking
//
//  Created by Soumya Duriseti on 2/14/21.
//
import Foundation
import SwiftUI
import MessageUI

struct ContentView: View {
    @State private var show_modal: Bool = false
    @State private var cough = false
    @State private var ache = false
    @State private var fever = false
    @State private var fatigue = false
    @State private var loss = false
    @State private var sore = false
    @State private var nausea = false
    @State private var pain = false
    @State private var selectedFeeling = "Same"
    @State private var feel = ["Worse", "Same", "Better"]
    
    var body: some View {
        
        NavigationView {
            Form {
                Picker("How do you feel today?", selection: $selectedFeeling) {
                    ForEach(feel, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Section{
                Toggle("Cough or Shortness of Breath", isOn: $cough)
                Toggle("Muscle or Body Aches", isOn: $ache)
                Toggle("Fever or Chills", isOn: $fever)
                Toggle("Fatigue or Headache", isOn: $fatigue)
                Toggle("Loss of Taste or Smell", isOn: $loss)
                Toggle("Sore Throat or Congestion", isOn: $sore)
                Toggle("Nausea or Vomiting", isOn: $nausea)
                Toggle("Persistent Pain or Pressure in Chest", isOn: $pain)
                }
                Section{
                Button(action: {
                    MailComposeViewController.shared.sendEmail()
                    if pain == true || nausea == true {
                    self.show_modal = true
                    }
                    //self.show_modal.toggle()
                    }, label: {
                        Text("Save log")
                    }).sheet(isPresented: self.$show_modal) {
                    ModalView()
                }
                }
                }.navigationTitle("Log your symptoms")
        }
        .background(Color(red: 193, green: 165, blue: 188))
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
class MailComposeViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    static let shared = MailComposeViewController()
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["soumyaduriseti@gmail.com"])
            mail.setMessageBody("<p>Attached: patient x's symptom logs</p>", isHTML: true)
            UIApplication.shared.windows.first?.rootViewController?.present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

struct ModalView: View {
    var body: some View {
        Text("You display a Serious Symptom. Contact Your Doctor Immediately!")
        .font(Font.largeTitle)
        .multilineTextAlignment(.center)
        .foregroundColor(Color.red)
    }
    //.foregroundColor(Color.orange)
    
}
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
