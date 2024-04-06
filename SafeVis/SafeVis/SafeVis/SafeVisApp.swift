//
//  SafeVisApp.swift
//  SafeVis
//
//  Created by Dina Taing on 4/5/24.
//

import SwiftUI
import AVFoundation

@main
struct SafeVisApp: App {
    
    init() {
        let cvc = CameraViewController()
        cvc.viewDidLoad()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    func setupCamera() {
        print("setupCamera entered")
    }
    private let sessionQueue = DispatchQueue(label: "session queue")
}

class CameraViewController: UIViewController, AVCaptureFileOutputRecordingDelegate, AVCapturePhotoOutputReadinessCoordinatorDelegate {
    
    private let session = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "session queue")
    private var setupResult: SessionSetupResult = .success
    
    private enum SessionSetupResult {
        case success
        case notAuthorized
        case configurationFailed
    }
    
    //interface BS
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: (any Error)?) {
        //TODO
    }
    //------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //...
        
        //---CHECK PLEASE---
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            break
        case .notDetermined:
            // Ask for camera permissions please owo
            sessionQueue.suspend()
            
            sessionQueue.suspend()
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
                if !granted {
                    self.setupResult = .notAuthorized
                }
                self.sessionQueue.resume()
            })
            
        default:
            // The user has previously denied access.
            setupResult = .notAuthorized
            break
        }
        //-----------------
        
        print(setupResult)
        
    }
}
