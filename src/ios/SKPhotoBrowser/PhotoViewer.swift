//
//  PhotoViewer.swift
//  oa
//
//  Created by XXX on 2016/11/26.
//
//

import Foundation

@objc(PhotoViewer) class PhotoViewer : CDVPlugin {

    var scanCallBackId :String!

    func openPhotoFromUrl(_ command:CDVInvokedUrlCommand){
        var urls = [String]()
        urls = (command.arguments[0] as? [String])!
        let index = (command.arguments[1] as? Int)!
        var images = [SKPhoto]()

        for url in urls{
                  let photo = SKPhoto.photoWithImageURL(url)
            photo.shouldCachePhotoURLImage = true
            // you can use image cache by true(NSCache)
            images.append(photo)
        }
        //打开后关闭statusbar
        SKPhotoBrowserOptions.displayStatusbar = false
        
        //单机关闭
        SKPhotoBrowserOptions.enableSingleTapDismiss = true
      
        
        print(urls.count)
        //如果数量小于10使用pagecontrol
        //大于10显示文字统计
        
        //SKPhotoBrowserOptions是单例，所以每次执行都要判断，否则会互相影响
        
        if(urls.count<10){
            //不显示文字统计
            SKPhotoBrowserOptions.displayCounterLabel = false
        }else{
            SKPhotoBrowserOptions.displayCounterLabel = true
        }
        
        //不显示左右按钮
        SKPhotoBrowserOptions.displayBackAndForwardButton = false

    
        
        //不显示关闭按钮
        SKPhotoBrowserOptions.displayCloseButton = false
        
        //关闭上下滑动关闭的功能
        SKPhotoBrowserOptions.disableVerticalSwipe = true
        
        // 2. create PhotoBrowser Instance, and present.
        let browser = SKPhotoBrowser(photos: images)
        browser.initializePageIndex(index)
        self.viewController?.present(browser, animated: true,completion: nil)
        self.scanCallBackId=command.callbackId
    }
}
