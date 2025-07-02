apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply plugin: 'com.google.gms.google-services'

android {
    namespace 'com.example.gapoeat'
    compileSdkVersion 34

    defaultConfig {
        applicationId "com.example.gapoeat"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0"
        multiDexEnabled true
    }

    compileOptions {
        coreLibraryDesugaringEnabled true
        sourceCompatibility JavaVersion.VERSION_11
        targetCompatibility JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation 'androidx.appcompat:appcompat:1.4.2'
    coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:2.0.4'
}
