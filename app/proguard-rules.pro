# Keep the embedded yt-dlp/FFmpeg bridge: it is reached through JNI and
# reflection, so R8 cannot see all of its entry points.
-keep class com.yausername.** { *; }

# yt-dlp JSON is mapped onto these beans by Jackson.
-keep class com.yausername.youtubedl_android.mapper.** { *; }
-keepattributes RuntimeVisibleAnnotations,RuntimeVisibleParameterAnnotations,AnnotationDefault

# Commons Compress builds ZIP extra-field handlers through reflection while
# unpacking the Python and FFmpeg runtimes.
-keep class org.apache.commons.compress.archivers.zip.** { *; }
-keep class org.apache.commons.io.** { *; }

-dontwarn org.apache.commons.compress.**
-dontwarn org.apache.commons.io.**
-dontwarn com.fasterxml.jackson.**
