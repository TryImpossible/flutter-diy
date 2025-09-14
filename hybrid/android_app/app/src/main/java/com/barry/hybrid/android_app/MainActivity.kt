package com.barry.hybrid.android_app

import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.ElevatedButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.barry.hybrid.android_app.official.OfficialIntegrationActivity
import com.barry.hybrid.android_app.ui.theme.Android_appTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            Android_appTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Content(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(innerPadding), onOfficialClick = {
                            startActivity(Intent(this, OfficialIntegrationActivity::class.java))
                        })
                }
            }
        }
    }
}

@Composable
fun Content(modifier: Modifier = Modifier, onOfficialClick: () -> Unit = {}) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        ElevatedButton(onClick = onOfficialClick) {
            Text(text = "官方的集成方式")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    Android_appTheme {
        Content()
    }
}