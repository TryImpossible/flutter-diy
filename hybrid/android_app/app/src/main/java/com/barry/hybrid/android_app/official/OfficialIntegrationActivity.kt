package com.barry.hybrid.android_app.official

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.barry.hybrid.android_app.R
import io.flutter.embedding.android.FlutterActivity

class OfficialIntegrationActivity : AppCompatActivity(), View.OnClickListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_official_integration)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        findViewById<AppCompatButton>(R.id.btn_start_flutter_activity).setOnClickListener(this)
        findViewById<AppCompatButton>(R.id.btn_start_flutter_fragment).setOnClickListener(this)
    }

    override fun onClick(p0: View?) {
        when (p0?.id) {
            R.id.btn_start_flutter_activity -> {
//                startActivity(
//                    FlutterActivity.createDefaultIntent(this)
//                )
                startActivity(
                    FlutterActivity.withCachedEngine("my_engine_id")
//                        .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                        .build(this)
                )
            }

            R.id.btn_start_flutter_fragment -> {
                startActivity(Intent(this, ExistingFlutterFragmentActivity::class.java))
            }
        }
    }
}