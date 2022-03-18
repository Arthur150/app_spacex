import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyB5sLJ-7ue2N4g5Whvk1ZGVXA0D35iJIVs")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
