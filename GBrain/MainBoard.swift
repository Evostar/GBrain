//
//  MainBoard.swift
//  ConvertGreatBrain
//
//  Created by davidforlove on 12/16/14.
//  Copyright (c) 2014 davidforlove. All rights reserved.
//

import UIKit

import GoogleMobileAds

import AudioToolbox

var score = Int()

class MainBoard: UIViewController{

  
   
    @IBOutlet weak var bannerView: GADBannerView!
    
    //定义mainstory board 控件
    
    
    @IBOutlet weak var scoreSource: UILabel!
    
    @IBOutlet weak var timeSource: UILabel!
   

    @IBOutlet weak var noBtn: WTTipButton!

    @IBOutlet weak var yesBtn: WTTipButton!
    
    
    @IBOutlet weak var rightArrowView: WTArrowView!
    
    
    @IBOutlet weak var leftArrowView: WTArrowView!
    
    @IBOutlet weak var centerXLeft: NSLayoutConstraint?
    
    @IBOutlet weak var centerXRight: NSLayoutConstraint?
    
    //定义变量UIScreen().bounds.size.width
  
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    let kInitialRadius = CGFloat(20.0)//初始直径
    let KInitialHeight = CGFloat(118.0)//初始高度
    let kRadiusRise = CGFloat(15.0)//半径递增量
    let kSpaceHeight = CGFloat(35.0)//圆间隔高度
    let kDropHeight = CGFloat(50.0)//动画执行高度
    let kIntervalTime = 0.2 //动画耗时
    let kPerScore = CGFloat(20) //单项得分
    
    //let fontName = ["红","蓝","绿"]
    //  let fontColor = [ UIColor.redColor(),UIColor.blueColor(),UIColor.greenColor()]
    
    let colorDic:NSDictionary = [
    "蓝": UIColor.blueColor(),
    "红": UIColor.redColor(),
    "绿": UIColor.greenColor(),
    "黑": UIColor.blackColor(),
   // "棕": UIColor.brownColor(),
    "紫": UIColor.purpleColor(),
    "橙": UIColor.orangeColor()]
    

    var currentView = WTCircleView()
    var second = Int()
   // var score = Int()
    var timer = NSTimer()
    
    
    
    var circleArray:NSMutableArray = []
    
    //circleArray.addObject(createCircleWithi(0, Color:nil, ColorName:nil))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.bannerView.adUnitID = "ca-app-pub-7698119169682694/1756487164"
        
        self.bannerView.rootViewController = self
        
        var request: GADRequest = GADRequest()
        
       // request.testDevices = [GAD_SIMULATOR_ID]
        
        self.bannerView.loadRequest(request)

        
        
        
        
        
        
        self.addObserver(self, forKeyPath: "score", options:NSKeyValueObservingOptions.New | NSKeyValueObservingOptions.Old, context: nil)
        
        score = 0
        self.second = 60
        self.scoreSource.text = NSString(format:"%d分", score)
       // scoreString = self.scoreSource.text!
        for var i = 0; i<4; i++ {
            
            circleArray.addObject(createCircleWithi(i, Color:nil, ColorName:nil))
           
            var circle:WTCircleView
            circle = circleArray[i] as WTCircleView
            circle.alpha = 1
        
        }
        
        
        timer =  NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
         // [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func createCircleWithi(i:(Int), Color:(UIColor?),ColorName:(NSString?))->(WTCircleView){
        
       var t = CGFloat(i)
       var circle = WTCircleView()
       var SCREEN_WIDTH = screenSize.width
        circle.frame = CGRectMake((SCREEN_WIDTH  - (kInitialRadius +  t * kRadiusRise)) / 2, KInitialHeight + (kInitialRadius + kSpaceHeight) * t + kRadiusRise * t * (t - 1) / 2 , kInitialRadius + t * kRadiusRise, kInitialRadius + t * kRadiusRise)
        
       var count = NSInteger(self.colorDic.allKeys.count)
       var x = UInt32(0)
       var y = UInt32(0)
        
        if  Color == nil {
            
             x = arc4random() % UInt32(count)
             circle.color = self.colorDic.allValues[Int(x)] as UIColor
        }else{
          
            circle.color = Color
        
        }
       
        if ColorName == nil && x<3 {
            
            y = arc4random() % UInt32(3)
            circle.colorName = self.colorDic.allKeys[Int(y)] as NSString
            
        }else if ColorName == nil && x>=3 {
            y = (arc4random() % UInt32(3))+3
             circle.colorName = self.colorDic.allKeys[Int(y)] as NSString
        
        }else {
         circle.colorName = ColorName
        
        }
       
        self.view.addSubview(circle)
        
        var layer = CALayer()
        layer.frame = CGRectMake(0, 0, kInitialRadius + t * kRadiusRise, kInitialRadius + t * kRadiusRise)
        layer.opacity = 0.5
        layer.backgroundColor = UIColor.lightGrayColor().CGColor
        layer.cornerRadius = (kInitialRadius + t * kRadiusRise) / 2
        circle.layer.addSublayer(layer)
        if(i == 3){
            layer.opacity = 0
        }
        
        circle.alpha = 0
        
        return circle
        
    }

    
  func updateTime(){
    
    if second > 0 {
    second--
        if second >= 10 {
            timeSource.text = NSString(format: "00:%d", second)}
        else {
            timeSource.text = NSString(format: "00:0%d", second )}
        
            
        
        }else{
      //  second = 15
        timer.invalidate()
        self.performSegueWithIdentifier("myResultBoard", sender: self)
        
        
    }
    
    
    
    }
    
    @IBAction func yesBtnClick(sender: AnyObject) {
      
        currentView = self.circleArray.lastObject as WTCircleView
       // println("yes") // testing 
  
        if   colorDic.objectForKey(currentView.colorName) as UIColor == currentView.color{
             score += 10
             self.scoreSource.text = NSString(format:"%d分", score)
             self.addArrowAnimation()
             self.addCircleAnimation()
        }else{
            second -= 5 //adding penalty
            self.AddTwinkleAnimation()
            AudioServicesPlaySystemSound(0x00000FFF)
        }
    }

    @IBAction func noBtnClick(sender: AnyObject) {
    
        currentView = self.circleArray.lastObject as WTCircleView
      

       // println("no") //testing

        if colorDic.objectForKey(currentView.colorName) as UIColor == currentView.color{
            second -= 5 //adding penalty
            self.AddTwinkleAnimation()
            AudioServicesPlaySystemSound(0x00000FFF)
        }else{
            score += 10
            self.scoreSource.text = NSString(format:"%d分", score)
            self.addArrowAnimation()
            self.addCircleAnimation()
        
        }
        
      
    }
    
    func AddTwinkleAnimation(){
        
        var animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.autoreverses = true
        animation.duration = 0.1
        animation.repeatCount = 3
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        currentView.layer.addAnimation(animation, forKey: nil)
        
    }
    
    func addCircleAnimation(){
        for var i = 0; i < self.circleArray.count; i++ {
            var circle:WTCircleView = self.circleArray[i] as WTCircleView
            
            if(i == self.circleArray.count - 1){
                self.circleArray.removeObject(circle)
                circle.removeFromSuperview()
                
                circle = self.createCircleWithi(0, Color: nil, ColorName: nil)
                circle.frame = CGRectMake(circle.frame.origin.x, circle.frame.origin.y - self.kDropHeight, circle.frame.size.width, circle.frame.size.height)
                self.circleArray.insertObject(circle, atIndex: 0)
                
                UIView.animateWithDuration(kIntervalTime, animations: {() in circle.alpha = 1}, completion:{(Bool)  in UIView.animateWithDuration(self.kIntervalTime, animations:{ () in  circle.frame = CGRectMake(circle.frame.origin.x, circle.frame.origin.y + self.kDropHeight, circle.frame.size.width, circle.frame.size.height)}, completion: {(Bool) in })})
       
                break
    
                }
            var newCircle:WTCircleView = self.createCircleWithi(i+1, Color: circle.color, ColorName: circle.colorName)
            newCircle.frame = CGRectMake(newCircle.frame.origin.x, newCircle.frame.origin.y - self.kDropHeight, newCircle.frame.size.width, newCircle.frame.size.height);
            self.circleArray.removeObject(circle)
            self.circleArray.insertObject(newCircle, atIndex: i)
            UIView.animateWithDuration(kIntervalTime, animations: {() in  circle.alpha = 0;newCircle.alpha = 1}, completion:{(Bool)  in UIView.animateWithDuration(self.kIntervalTime, animations:{ () in  newCircle.frame = CGRectMake(newCircle.frame.origin.x, newCircle.frame.origin.y + self.kDropHeight, newCircle.frame.size.width, newCircle.frame.size.height)}, completion: {(Bool) in })})
            }




    }

    
    func addArrowAnimation(){
    
        UIView.animateWithDuration(kIntervalTime, animations: {() in  self.yesBtn.enabled = false
            self.centerXLeft?.constant = 100.0
            self.centerXRight?.constant = -100.0
            self.view.layoutIfNeeded()}, completion:{(Bool)  in UIView.animateWithDuration(self.kIntervalTime, animations:{ () in  self.centerXLeft?.constant = 80.0
                self.centerXRight?.constant = -80.0
                self.view.layoutIfNeeded()}, completion: {(Bool) in self.yesBtn.enabled = true
            })
        })
    
    }
    
    
    // iAd implement
    /*
     func bannerViewDidLoadAd(banner: ADBannerView!) {
        
        UIView.beginAnimations(nil, context: nil)
      // UIView.setAnimationDelay(4)
        UIView.setAnimationDuration(1)
        banner.alpha = 1
        UIView.commitAnimations()
        
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        
        
        UIView.beginAnimations(nil, context: nil)
     //UIView.setAnimationDelay(4)
        UIView.setAnimationDuration(1)
        banner.alpha = 0
        UIView.commitAnimations()

    }*/
    
    
    
}