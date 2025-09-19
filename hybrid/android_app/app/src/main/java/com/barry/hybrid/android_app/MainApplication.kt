package com.barry.hybrid.android_app

import android.app.Activity
import android.app.Application
import android.content.Intent
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.FlutterBoostDelegate
import com.idlefish.flutterboost.FlutterBoostRouteOptions
import com.idlefish.flutterboost.FlutterBoostSetupOptions
import com.idlefish.flutterboost.containers.FlutterBoostActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor


class MainApplication : Application() {
    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()
        initFlutterByOfficial()
        initFlutterByFlutterBoost()
    }

    /**
     * 官方的方式初始化Flutter
     */
    private fun initFlutterByOfficial() {
        // Instantiate a FlutterEngine.
        flutterEngine = FlutterEngine(this)

        // Configure an initial route.
//        flutterEngine.navigationChannel.setInitialRoute("your/route/here");

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault(), listOf<String>("--mode=official")
        )

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache.getInstance().put("my_engine_id", flutterEngine)
    }

    /**
     * FlutterBoost的方式初始化Flutter
     */
    private fun initFlutterByFlutterBoost() {
        val options: FlutterBoostSetupOptions =
            FlutterBoostSetupOptions.Builder().dartEntrypointArgs(listOf<String>("--mode=flutterboost")).build()
        FlutterBoost.instance().setup(this, object : FlutterBoostDelegate {
            override fun pushNativeRoute(options: FlutterBoostRouteOptions) {
                val activity: Activity? = FlutterBoost.instance().currentActivity()
                if (activity == null) {
                    return
                }
                //这里根据options.pageName来判断你想跳转哪个页面
                val pageName: String? = options.pageName()
                if (pageName.isNullOrEmpty()) {
                    return
                }
                if (pageName == "/native-page") {
                    val arguments: Map<String, Any> = options.arguments()
                    val intent: Intent = Intent(activity, OtherActivity::class.java)
                    intent.putExtra("data", arguments["data"] as String)
                    activity.startActivityForResult(intent, options.requestCode())
                }
            }

            override fun pushFlutterRoute(options: FlutterBoostRouteOptions) {
                val activity: Activity? = FlutterBoost.instance().currentActivity()
                if (activity == null) {
                    return
                }
                val pageName: String? = options.pageName()
                if (pageName.isNullOrEmpty()) {
                    return
                }
                val intent = FlutterBoostActivity.CachedEngineIntentBuilder(FlutterBoostActivity::class.java)
                    .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.opaque).destroyEngineWithActivity(false)
                    .uniqueId(options.uniqueId()).url(options.pageName()).urlParams(options.arguments())
                    .build(activity)
                activity.startActivityForResult(intent, options.requestCode())
            }
        }, FlutterBoost.Callback { engine: FlutterEngine? -> }, options)
    }
}