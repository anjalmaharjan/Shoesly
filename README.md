# Shoesly

Shoesly is a ecommerce application designed specially for shoe market and it includes shoes of popular brands where customers can buy the shoes according to their sizes, see reviews on the shoe, choose colors for their shoe and pay through the application which has a good user interface and user experince for purchasing shoes from their fingertips.

# Project Setup Instructions

Step 1 : First clone the app 
Step 2 : Then type flutter pub get on terminal
Step 3 : Open the target device which you want to run the application either Android or iOS.
Step 4 : Enjoy using the application.

# Assumptions made during development

First Assumption : 

For UI:

Step 1 : Ui were designed according to provided figma  
Step 2 : Animtaions were included by own assumptions for better experience
Step 3 : Assuming the font used was Urbanist thiis font is used in the application.

For Database: (FIREBASE)

Step 1 : The database was created using Firestore Database for the products to be displayed.
Step 2 : The Storage feature of Firebase was used to store images and logos of the shoe
Step 3 : After the payment has been completed then the payment data is sent to Realtime Database 

# State Management

State Management in this app is handled by using Bloc.

# Architecture 

This app follows the Clean Architecture pattern to maintain separation of concerns and make the codebase more scalable and maintainable.

# Flutter Packages Used

This is the list of flutter packages used in the project 

For dependencies 

cupertino_icons: ^1.0.6
flutter_svg: ^2.0.10+1
firebase_core: ^2.32.0
firebase_messaging: ^14.9.4
http: ^1.2.1
flutter_local_notifications: ^17.1.2
flutter_slidable: ^3.1.0
cloud_firestore: ^4.17.5
flutter_bloc: ^8.1.5
freezed: ^2.5.2
freezed_annotation: ^2.4.1
fpdart: ^1.1.0
firebase_database: any
internet_connection_checker_plus: any
carousel_slider: ^4.2.1
dots_indicator: ^3.0.0

For dev dependencies

flutter_lints: ^3.0.0
build_runner: ^2.3.3
json_serializable: ^6.8.0

# Challenges faced

For UI:

Challenges:

For UI the images , the icons and brand logos need to be downloaded from figma according which was time consuming 

For responsiveness:

There was not enought time for the application to be responsive in every platform.

Solution:

I used only a single image fo shoe but, made brand logs different

For responsiveness:

I have handled the responsivess for mobile platform and for other platforms i have made a Reponsive class that will handle Ui to different platforms accordingly.

# Addtitional features and improvements

The cart page only shows the dot above its icon if the cart list has products.

Observe navigation if a naviagtion has been sent for android platform.

Animations for pages like navigating to product details
Implementation of image slider.

After payment there is shown a success for better user experience.