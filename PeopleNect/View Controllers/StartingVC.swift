//
//  StartingVC.swift
//  PeopleNect
//
//  Created by Apple on 08/09/17.
//  Copyright © 2017 InexTure. All rights reserved.
//

import UIKit




class StartingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        
        // change Status bar Color
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = blueThemeColor
        }
        UIApplication.shared.statusBarStyle = .lightContent
        
        appdel.initLocation()
        
        let language = NSLocale.preferredLanguages[0]
        
        print("language is",language)
        
        if language == "pt-BR"
        {
            self.setUserDefault(ObjectToSave: kFR as AnyObject?, KeyToSave: kLanguage)
            _ = SetLanguage(language: Localisator.sharedInstance.availableLanguagesArray[1])
        }
        else
        {
            self.setUserDefault(ObjectToSave: kEN as AnyObject?, KeyToSave: kLanguage)
            _ = SetLanguage(language: Localisator.sharedInstance.availableLanguagesArray[0])
        }
        
        
        print("FIND A JOB in portuguese",Localization(string: "FIND A JOB"))

        
        
        
//
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickFindJob(_ sender: AnyObject) {
        
      let jobregisterVC = self.storyboard?.instantiateViewController(withIdentifier: "JobRegisterVC") as! JobRegisterVC
        navigationController?.pushViewController(jobregisterVC, animated: true)
    }

    @IBAction func clickFindProfessionals(_ sender: AnyObject) {

       let empregisterVC = self.storyboard?.instantiateViewController(withIdentifier: "EmpRegisterVC") as! EmpRegisterVC
        navigationController?.pushViewController(empregisterVC, animated: true)
        
//       let storyBoard : UIStoryboard = UIStoryboard(name: "Employee", bundle:nil)
//        let empdashboardVC = storyBoard.instantiateViewController(withIdentifier: "JobOnGoingDetailsVC") as! JobOnGoingDetailsVC
//        self.navigationController?.pushViewController(empdashboardVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func setUserDefault(ObjectToSave : AnyObject?  , KeyToSave : String)
    {
        let defaults = UserDefaults.standard
        
        if (ObjectToSave != nil)
        {
            defaults.set(ObjectToSave!, forKey: KeyToSave)
        }
        
        UserDefaults.standard.synchronize()
    }

    
}
