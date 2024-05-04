//
//  ViewControllerExt.swift
//  API Call
//
//  Created by Mayank Barnwal on 04/05/24.
//

import UIKit


extension UIViewController{
    func showWaitingView(){
        hideWaitingView()
        let waitingView = WaitingView.init(frame: self.view.bounds)
        waitingView.tag = 500
        waitingView.animationView.play()
        view.addSubview(waitingView)
    }
    
    func hideWaitingView(){
        for v in self.view.subviews{
            if v.tag == 500{
                if let waitingView = v as? WaitingView{
                    waitingView.animationView.stop()
                    v.removeFromSuperview()
                }
            }
        }
    }
    
    public func makeAlert(_ message: String?, _ title: String? = "", isErrorMessage:Bool? = false) {
        
        var appName = title
        
        if title == "" || title == nil{
            appName = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
        }
        
        let alert = UIAlertController(title: appName, message: message, preferredStyle: .alert)
        
        let okAlert = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil)
        
        alert.addAction(okAlert)
        
        present(alert, animated: true, completion: nil)
    }
}
