package com.barry.hybrid.android_app.official

import android.app.Dialog
import android.graphics.Color
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import androidx.appcompat.widget.ListPopupWindow.MATCH_PARENT
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsControllerCompat
import androidx.fragment.app.DialogFragment
import com.barry.hybrid.android_app.R
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.android.RenderMode
import io.flutter.embedding.android.TransparencyMode
import androidx.core.graphics.drawable.toDrawable

class TransparentFlutterDialogFragment : DialogFragment() {

    companion object {
        const val TAG_FRAGMENT_FLUTTER_DIALOG: String = "flutter_dialog"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // 设置样式：无标题 + 透明背景
        setStyle(STYLE_NO_TITLE, R.style.TransparentDialogTheme)
    }

    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
        val dialog = super.onCreateDialog(savedInstanceState)
        dialog.window?.setBackgroundDrawableResource(android.R.color.transparent)
        dialog.setCanceledOnTouchOutside(true)
        return dialog
    }

    override fun onStart() {
        super.onStart()
        dialog?.window?.let { window ->
            window.setLayout(MATCH_PARENT, MATCH_PARENT)
            window.setBackgroundDrawable(Color.TRANSPARENT.toDrawable())

            // 内容延伸到状态栏
            WindowCompat.setDecorFitsSystemWindows(window, false)

            // 状态栏图标为深色（适配白色背景）
            val controller = WindowInsetsControllerCompat(window, window.decorView)
            controller.isAppearanceLightStatusBars = true
            controller.isAppearanceLightNavigationBars = true
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        // 创建一个容器，用于放置 FlutterFragment
        val frameLayout = FrameLayout(requireContext())
        frameLayout.id = View.generateViewId() // 为 FlutterFragment 提供容器 ID
        frameLayout.setBackgroundColor(Color.TRANSPARENT)
        frameLayout.layoutParams = ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT
        )
        return frameLayout
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // 检查是否已经添加 FlutterFragment
        val existing = childFragmentManager.findFragmentByTag(TAG_FRAGMENT_FLUTTER_DIALOG)
        if (existing == null) {

            val flutterFragment = FlutterFragment.withNewEngine()
                .transparencyMode(TransparencyMode.transparent)
                .dartEntrypointArgs(listOf<String>("--mode=official"))
                .initialRoute("dialog")
                .build<FlutterFragment>()

            childFragmentManager
                .beginTransaction()
                .replace(view.id, flutterFragment, TAG_FRAGMENT_FLUTTER_DIALOG)
                .commitNowAllowingStateLoss()

        }
    }

}
