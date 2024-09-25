package com.example.flutter_fabby_demo

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
class MainActivity: FlutterActivity(){
    private val CHANNEL = "deeplink.flutter.dev/channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getInitialLink") {
                result.success(intent?.dataString)
            }
        }
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        // Handle new deep link when the app is already running
        if (intent.action == Intent.ACTION_VIEW) {
            MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).invokeMethod("onDeepLink", intent.dataString)
        }
    }
}
