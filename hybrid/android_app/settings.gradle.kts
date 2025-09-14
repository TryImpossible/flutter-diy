pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)

    var storageUrl = System.getenv()["FLUTTER_STORAGE_BASE_URL"] ?: "https://storage.googleapis.com"
    repositories {
        google()
        mavenCentral()
        maven("${storageUrl}/download.flutter.io")
        maven(url = "${rootProject.projectDir.parent}/flutter_module/build/host/outputs/repo")
    }
}

rootProject.name = "android_app"
include(":app")

// Replace "flutter_module" with whatever package_name you supplied when you ran:
// `$ flutter create -t module [package_name]
val filePath = settingsDir.parentFile.toString() + "/flutter_module/.android/include_flutter.groovy"
apply(from = File(filePath))
 