package com.barry.hybrid.android_app.flutterboost

import com.idlefish.flutterboost.containers.FlutterBoostActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode

class TransparentFlutterActivity : FlutterBoostActivity(){
    override fun getBackgroundMode(): BackgroundMode {
        if (super.getBackgroundMode() != BackgroundMode.transparent) {
            throw AssertionError("You *MUST* set FlutterActivity#backgroundMode correctly.")
        }
        return super.getBackgroundMode()
    }
}