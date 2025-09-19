package com.barry.hybrid.android_app.flutterboost

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.AppCompatButton
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.barry.hybrid.android_app.R
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.FlutterBoostRouteOptions


class FlutterBoostIntegrationActivity : AppCompatActivity(), View.OnClickListener {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_flutter_boost_integration)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        findViewById<AppCompatButton>(R.id.btn_start_flutter_activity).setOnClickListener(this)
    }

    override fun onClick(p0: View?) {
        when (p0?.id) {
            R.id.btn_start_flutter_activity -> {
                val options = FlutterBoostRouteOptions.Builder()
                    .pageName("/main-page")
                    .arguments(mapOf<String, Any>("data" to "来自原生的数据"))
                    .requestCode(1111)
                    .build()
                FlutterBoost.instance().open(options)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 1111) {
            Toast.makeText(this, data?.getSerializableExtra("ActivityResult").toString(), Toast.LENGTH_LONG).show();
        }
    }
}