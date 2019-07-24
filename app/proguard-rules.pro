# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# Display some more statistics about the processed code.
-verbose

# The Android manifest already refers to the mutlidex support application.
# We now enable multidexing. DexGuard automatically figures out how to
# split the classes.dex file, if the code exceeds the infamous 65K method ID
# limit of the Dalvik file format. The Android runtime then glues the parts
# back together, if necessary with the help of the  multidex compatibility
# library, which you can add to the project.
# This option works in all build systems: Gradle, Ant, Eclipse, Maven,...
-multidex

# To target a minimum API level less than 19
-target 1.6

# Ignore warnings on spring framework message converters
-dontwarn "org.simpleframework.xml.**",
           "org.codehaus.jackson.**",
           "com.fasterxml.jackson.**",
           "com.google.code.rome.android.repackaged.com.sun.syndication.**",
           "org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement"

# Keep fonts
-keepresourcefiles assets/fonts/*

# Keep animation files
-keepresourcefiles assets/gfx/ic_star.png
-keepresourcefiles assets/gfx/rewards_cup.png
-keepresourcefiles assets/gfx/rewards_cup_lid.png
-keepresourcefiles assets/gfx/rewards_cup_lid_bottom.png
-keepresourcefiles assets/gfx/rewards_cup_lid_shadow.png

# Keep wiget shortcut icons
-keepresources res/drawable/widget_1_x_1_rewards.png
-keepresources res/drawable-hdpi/widget_1_x_1_rewards.png

# Keep classes with native methods to support animation
-keepclasseswithmembers class * {
    native <methods>;
}

# Keep google analytics files
-keepresources string/ga_trackingId
-keepresources string/gcm_defaultSenderId
-keepresources string/google_api_key
-keepresources string/google_app_id
-keepresources string/google_crash_reporting_api_key

# Keep Google Maps Key
-keepresources string/google_maps_key

# Keep Passcode resources since dialogue obfuscation breaks the flow
-keepresourcefiles res/layout/alert_passcode_one_attempt.xml
-keepresourcefiles res/layout/alert_passcode_forgot.xml

-keep class com.starbucks.in.Settings.Passcode.Activity.PinEntryView {
    *;
}

# Added for handling TLS 1.2
-keepresourcexmlelements manifest/application/meta-data@value=GlideModule
-keep class com.starbucks.in.Reusable.Glide.UnsafeOkHttpGlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
**[] $VALUES;
public *;
}
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
 **[] $VALUES;
 public *;
 }

# Encrypt Model Classes
-encryptclasses com.starbucks.in.Model.**

# Remove Android logging calls (in this case, including errors).
-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int d(...);
    public static int i(...);
    public static int w(...);
    public static int e(...);
    public static java.lang.String getStackTraceString(java.lang.Throwable);
}

# Remove Java logging calls.
-assumenosideeffects class java.util.logging.Logger {
    public static java.util.logging.Logger getLogger(...);
    public boolean isLoggable(java.util.logging.Level);
    public void entering(...);
    public void exiting(...);
    public void finest(...);
    public void finer(...);
    public void fine(...);
    public void config(...);
    public void info(...);
    public void warning(...);
    public void severe(...);
}

# Remove Apache Commons logging calls.
-assumenosideeffects class org.apache.commons.logging.Log {
    public boolean is*Enabled();
    public void trace(...);
    public void debug(...);
    public void info(...);
    public void warn(...);
    public void error(...);
    public void fatal(...);
}

# Remove SLF4J logging calls.
-assumenosideeffects class org.slf4j.Logger {
    public boolean is*Enabled();
    public void trace(...);
    public void debug(...);
    public void info(...);
    public void warn(...);
    public void error(...);
}

# With the default configuration dexguard-library-release-aggressive.pro,
# we need to explicitly keep all public API. This means that we can
# obfuscate the classes in all internal packages.
-keep public class !**.internal.**, com.google.** {
    public protected *;
}

# Encrypt distance matrix key
-encryptstrings public class com.starbucks.in.stores.StoresConstants {
    java.lang.String STORE_DISTANCE_KEY;
    java.lang.String STORE_DISTANCE_NEW_KEY;
}


# Encrypt client credentials
-encryptstrings public class com.starbucks.in.Constants {
    java.lang.String REFRESH_TOKEN_UNAUTH_AUTHORISATION;
    java.lang.String TOKEN_AUTH_AUTHORISATION;
}

# Encrypt strings
-encryptstrings "MD5"
-encryptstrings "BKS"
-encryptstrings "TLS"
-encryptstrings "GET"
-encryptstrings "X509"
-encryptstrings "https"
-encryptstrings "SHA-256"
-encryptstrings "AES"
-encryptstrings "https://uat.mobileapps.starbucks.in/*"
-encryptstrings public class com.starbucks.in.Constants {
    java.lang.String PAYMENT_MERCHANT_ID;
    java.lang.String PAYMENT_ACCESS_CODE_PRODUCTION;
    java.lang.String PAYMENT_ACCESS_CODE_UAT;
    java.lang.String AUTORELOAD_SI_TYPE;
    java.lang.String AUTORELOAD_SI_SETUP_AMT;
    java.lang.String AUTORELOAD_SI_CARD_TYPE;
    java.lang.String AUTORELOAD_SI_OPTION_PAY;
    java.lang.String ALTERNATE_KEY;
    java.lang.String KEY_STORE_FILENAME;
    java.lang.String KEY_STORE_ALIAS;
    java.lang.String KEY_STORE_ALGORITHM;
    java.lang.String KEY_GENERATOR_ALGORITHM;
    java.lang.String KEY_STORE_PASSWORD;
}

# Encrypt classes.
-encryptclasses com.starbucks.in.Network.CustomClientHttpRequestFactory
-encryptclasses com.guardsquare.dexguard.runtime.**

-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
-renamesourcefileattribute SourceFile
-keepresourcexmlelements manifest/application/meta-data@name=io.fabric.ApiKey

-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}

-keepclassmembers class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

-keepclassmembers class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator CREATOR;
}

-dontwarn android.support.v7.**
-keep class android.support.v7.** { *; }
-keep interface android.support.v7.** { *; }

#inventa rules

#suppress wranings
-dontwarn rx.**
-dontwarn com.squareup.okhttp.**
-dontwarn retrofit.**
-dontwarn okio.**
-dontwarn org.apache.**
-dontwarn android.support.design.internal.**
-dontwarn com.google.android.gms.**
-dontwarn android.support.v4.**
-dontwarn android.support.design.**
-dontwarn android.security.NetworkSecurityPolicy
-dontwarn com.crashlytics.**
-dontwarn javax.annotation.**
-dontnote retrofit2.Platform
# Platform used when running on Java 8 VMs. Will not be used at runtime.
-dontwarn retrofit2.Platform$Java8
# Retain generic type information for use by reflection by converters and adapters.
-keepattributes Signature
# Retain declared checked exceptions for use by a Proxy instance.
-keepattributes Exceptions
-dontwarn com.clevertap.android.sdk.**

-dontwarn org.xmlpull.v1.**
-dontwarn okhttp3.**

# The official support library.
-keep interface android.support.v4.** { *; }
-keep interface android.support.v7.** { *; }
-keep public class * extends android.support.v4.view.ActionProvider {
public <init>(android.content.Context);
}
-keep public class android.support.v7.widget.** { *; }
-keep public class android.support.v7.internal.widget.** { *; }
-keep public class android.support.v7.internal.view.menu.** { *; }
-keep class android.support.** { *; }
-keep interface android.support.design.** { *; }
-keep public class android.support.design.R$* { *; }

-keep public class com.google.firebase.iid.FirebaseInstanceId {
public *;
}

# Library projects.
-keep class com.squareup.** { *;}
-keep class com.google.** { *;}
-keep class retrofit.** { *; }
-keep class org.apache.http.** { *; }
-keep class com.crashlytics.** { *; }
-keep interface org.apache.http.** { *; }
-keep interface com.squareup.** { *;}
-keep interface retrofit.** { *; }

-keepclassmembers enum * { *; }

# project classes
-keepclasseswithmembers class * {
@retrofit.http.* <methods>; }
-keepattributes Signature
-assumenosideeffects class android.util.Log {
public static *** e(...);
public static *** w(...);
public static *** wtf(...);
public static *** d(...);
public static *** v(...);
public static *** i(...);
}

-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
-keep class * extends java.util.ListResourceBundle {
protected java.lang.Object[][] getContents();
}
# Keep SafeParcelable value, needed for reflection. This is required to support backwards
# compatibility of some classes.
-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
public static final *** NULL;
}
# Keep the names of classes/members we need for client functionality.
-keep @interface com.google.android.gms.common.annotation.KeepName
-keepnames @com.google.android.gms.common.annotation.KeepName class *
-keepclassmembernames class * {
@com.google.android.gms.common.annotation.KeepName *;
}
# Needed for Parcelable/SafeParcelable Creators to not get stripped
-keepnames class * implements android.os.Parcelable {
public static final ** CREATOR;
}

## ------------Begin for inventa sdk--------
-keep class proto.inventa.cct.com.inventalibrary.** { *; }
-dontwarn proto.inventa.cct.com.inventalibrary.**
-keep interface proto.inventa.cct.com.inventalibrary.** { *; }
-keep enum proto.inventa.cct.com.inventalibrary.** { *; }
##------------end for inventa------

##---------------Start: proguard configuration for Glide  ----------
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
**[] $VALUES;
public *;
}

# Uncomment for DexGuard only
#-keepresourcexmlelements manifest/application/meta-data@value=GlideModule
##---------------End: proguard configuration for Glide  ----------

##---------------begin: proguard configuration for okhttp  ----------
-dontwarn okio.**
-dontwarn javax.annotation.Nullable
-dontwarn javax.annotation.ParametersAreNonnullByDefault
##---------------End: proguard configuration for okhttp  ----------

##---------------begin: proguard configuration for realm  ----------
# Proguard Configuration for Realm (http://realm.io)
# For detailed discussion see: https://groups.google.com/forum/#!topic/realm-java/umqKCc50JGU
# Additionally you need to keep your Realm Model classes as well
# For example:
# -keep class com.yourcompany.realm.** { *; }

-keep class io.realm.annotations.RealmModule
-keep @io.realm.annotations.RealmModule class *
-keep class io.realm.internal.Keep
-keep @io.realm.internal.Keep class *
-dontwarn javax.**
-dontwarn io.realm.**

##---------------End: proguard configuration for relam  ----------

# dagger 2 - No special ProGuard rules required.


##---------------begin: proguard configuration for retrofit  ----------
# Platform calls Class.forName on types which do not exist on Android to determine platform.
-dontnote retrofit2.Platform
# Platform used when running on Java 8 VMs. Will not be used at runtime.
-dontwarn retrofit2.Platform$Java8
# Retain generic type information for use by reflection by converters and adapters.
-keepattributes Signature
# Retain declared checked exceptions for use by a Proxy instance.
-keepattributes Exceptions
##---------------End: proguard configuration for retrofit  ----------

##------------ begin for amazon aws---------
# Class names are needed in reflection
-keepnames class com.amazonaws.**
-keepnames class com.amazon.**
# Request handlers defined in request.handlers
-keep class com.amazonaws.services.**.*Handler
# The following are referenced but aren't required to run
-dontwarn com.fasterxml.jackson.**
-dontwarn org.apache.commons.logging.**
# Android 6.0 release removes support for the Apache HTTP client
-dontwarn org.apache.http.**
# The SDK has several references of Apache HTTP client
-dontwarn com.amazonaws.http.**
-dontwarn com.amazonaws.metrics.**
##----------end


##--- rx java
### RxJava, RxAndroid (https://gist.github.com/kosiara/487868792fbd3214f9c9)
-keep class rx.schedulers.Schedulers {
    public static <methods>;
}
-keep class rx.schedulers.ImmediateScheduler {
    public <methods>;
}
-keep class rx.schedulers.TestScheduler {
    public <methods>;
}
-keep class rx.schedulers.Schedulers {
    public static ** test();
}
-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
    long producerIndex;
    long consumerIndex;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
    long producerNode;
    long consumerNode;
}
-dontwarn sun.misc.Unsafe
##---

### Fabric
# In order to provide the most meaningful crash reports
-keepattributes SourceFile,LineNumberTable
# If you're using custom Eception
-keep public class * extends java.lang.Exception

-keep class com.crashlytics.** { *; }
-dontwarn com.crashlytics.**

### Other
-dontwarn com.google.errorprone.annotations.*

### Reactive Network
-dontwarn com.github.pwittchen.reactivenetwork.library.ReactiveNetwork
-dontwarn io.reactivex.functions.Function
-dontwarn rx.internal.util.**
-dontwarn sun.misc.Unsafe

### Retrolambda
# as per official recommendation: https://github.com/evant/gradle-retrolambda#proguard
-dontwarn java.lang.invoke.*

# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature

# For using GSON @Expose annotation
-keepattributes *Annotation*

# Gson specific classes
-keep class sun.misc.Unsafe { *; }
#-keep class com.google.gson.stream.** { *; }

# Application classes that will be serialized/deserialized over Gson
# -keep class com.google.gson.examples.android.model.** { *; }

# Prevent proguard from stripping interface information from TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

##------------For pushy ---------
-dontwarn me.pushy.**
-keep class me.pushy.** { *; }
##---------End for Pushy ---------

#AltBeacon
-dontwarn org.altbeacon.**
-keep class org.altbeacon.** { *; }
-keep interface org.altbeacon.** { *; }
-keepattributes

