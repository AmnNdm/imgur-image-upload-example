# imgur_image_upload

A simple Flutter project to learn how http multipart files work. Imgur open API is used for uploading the images picked from gallery using image picker alongwith getx for state management and clean code.

## Getting Started

This is a single screen app with a button for chosing/uploading image, image preview, and a scrollable list of ids of images uploaded that are clickable to preview those images.

![Screenshot_20220208-170947](https://user-images.githubusercontent.com/95464163/153132874-24efda1b-fb5d-4808-bc75-9898f227552c.png)

### Imgur API
[Register your application on Imgur](https://apidocs.imgur.com/#c85c9dfc-7487-4de2-9ecd-66f727cf3139) and then replace "id" in lib/constants.dart with your client ID.

### Packages used:
- [get - for state management](https://pub.dev/packages/get)
- [permission_handler - to check/request required permissions](https://pub.dev/packages/permission_handler)
- [image_picker - to pick image from the gallery](https://pub.dev/packages/image_picker)
- [http - to make http requests](https://pub.dev/packages/http)

### Android Permissions needed in the android/app/src/main/AndroidManifest.xml
inside the manifest tag
- uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"
- uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"
- uses-permission android:name="android.permission.ACCESS_MEDIA_LOCATION"

inside the application tag:
- android:requestLegacyExternalStorage="true"
