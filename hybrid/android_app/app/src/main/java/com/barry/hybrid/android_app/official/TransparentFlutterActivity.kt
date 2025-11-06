package com.barry.hybrid.android_app.official

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode

class TransparentFlutterActivity : FlutterActivity() {
    override fun getBackgroundMode(): BackgroundMode {
        if (super.getBackgroundMode() != BackgroundMode.transparent) {
            throw AssertionError("You *MUST* set FlutterActivity#backgroundMode correctly.")
        }
        return super.getBackgroundMode()
    }
}