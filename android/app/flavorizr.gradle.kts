import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.example.dev.template_flutter"
            resValue(type = "string", name = "app_name", value = "Template Flutter (Dev)")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.example.template_flutter"
            resValue(type = "string", name = "app_name", value = "Template Flutter")
        }
    }
}