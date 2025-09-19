package com.barry.hybrid.android_app

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import com.barry.hybrid.android_app.ui.theme.Android_appTheme


class OtherActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        val data: String = intent.getStringExtra("data") ?: ""
        setContent {
            Android_appTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Greeting(
                        data = data,
                        modifier = Modifier
                            .padding(innerPadding)
                            .fillMaxSize()
                            .wrapContentSize(align = Alignment.Center)
                    )
                }
            }
        }
    }

    override fun finish() {
        val intent = Intent()
        intent.putExtra("data", "原生回复数据给Flutter")
        setResult(RESULT_OK, intent)
        super.finish()
    }
}

@Composable
fun Greeting(data: String, modifier: Modifier = Modifier) {
    Text(
        text = data,
        modifier = modifier,
        textAlign = TextAlign.Center
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview2() {
    Android_appTheme {
        Greeting("Android")
    }
}