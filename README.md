# Spring Bird 🕊: Empowering Sustainable Shopping Practices 🛍
## Your Plastic-Free Shopping Assistant 🌱

Spring Bird is a software application aimed at promoting environment friendly shopping practices by providing users with information about the plastic content in products. It analyzes products and offers a rating based on the percentage of plastic found, helping users make informed, sustainable choices while shopping.

## Purpose

The issue of plastic pollution stems not from its production but from its irresponsible consumption, management, and recycling. Less than 10% of the world's plastic is actually recycled, leading to environmental pollution, habitat destruction, and resource depletion. **Spring Bird** aims to address this challenge by empowering users to make wise choices while shopping, thereby reducing plastic consumption and promoting environmentally friendly habits.

## Technical Components

### Backend

- **Firebase Authentication**: Manages user authentication securely.
- **Cloud Firestore**: Main backend database for real-time storage and synchronization of sustainability rating data.
- **Google Maps API**: Provides location-based services for users and real-time Sustainable Shopping.

### Machine Learning

- **TensorFlow**: Utilized for machine learning models for object segmentation and plastic detection.

### Frontend

- Developed using the **Flutter SDK** to create a seamless user interface for the mobile app.

### Analytics

- **Google Analytics**: Tracks user traffic and provides insights to improve app functionality.

### Google Cloud Platform

- Hosts and manages various backend services, including Firebase and Cloud Firestore.
- Offers scalable and reliable cloud computing resources for application deployment.

## Deployment

The Flutter frontend is compiled into native code for the Android platform. Google Cloud was chosen for deploying the ML model due to its scalability, reliability, and security.

## Walkthrough Video
[![Walkthrough Video](http://img.youtube.com/vi/FYFllzZMq-Y/0.jpg)](https://www.youtube.com/watch?v=FYFllzZMq-Y)

## Setup and Testing Instructions (Android)

Follow these steps to setup and test the Spring Bird app:

## Linux
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/gluonparticle/Spring-Bird.git
2. **Install Flutter:**

   Follow the [Flutter installation instructions for Linux](https://docs.flutter.dev/get-started/install/linux) to set up Flutter on your system.

3. **Extract Packages:**
   ```bash
   tar -xzvf package_name.tar.gz

4. **Open the Project in Android Studio/Visual Studio**
   1. Open Android Studio.
   2. Click on File > Open and navigate to the cloned Spring-Bird directory.
   3. Click Open

5. **Run the App:**

   1. In Android Studio, locate the main Flutter project file (main.dart) in the project explorer.
   2. Right-click on main.dart and select Run.
   3. Choose your connected Android device from the list of available devices.
   4. Click Run to install and launch the app on your Android device.

## Windows 
1. **Clone the repository**
   ```bash
   git clone https://github.com/gluonparticle/Spring-Bird.git

2. **Install Flutter:**

   Follow the [Flutter installation instructions for Linux](https://docs.flutter.dev/get-started/install/windows) to set up **Flutter** on your system.

3. **Extract the zip file**
   Extract the zip file using Windows Extract tool, WinRAR, 7 Zip or any other extraction software.

4. **Open the project**
    1. Open the Project in Visual Studio Code:
    2. Open Visual Studio Code.
    3. Click on **File > Open Folder** and navigate to the cloned **Spring-Bird** directory.
    4. Select the folder and click **Open**

## macOS
1. **Clone the repository**
   ```bash
   git clone https://github.com/gluonparticle/Spring-Bird.git

2. **Install Flutter:**

   Follow the [Flutter installation instructions for Linux](https://docs.flutter.dev/get-started/install/macos) to set up **Flutter** on your system.

3. **Extract the zip file**
   1. Navigate to the cloned **Spring-Bird** directory.
   2. If any packages or dependencies need to be unzipped, use the unzip command in the terminal:
      ```bash
      unzip Spring-Bird.zip

4. **Open the Project in Xcode:**
   1. **Open** Xcode.
   2. Click on **File > Open** and navigate to the cloned Spring-Bird directory.
   3. Select the ios subdirectory and click **Open.**
   
5. **Run the App:**

   1. In Xcode, select your device or simulator from the toolbar.
   2. Click the **Run **button to build and launch the app on your device or simulator.


1. Clone the repo ```git clone https://github.com/gluonparticle/Spring-Bird```
2. [Setup Flutter](https://docs.flutter.dev/get-started/install) on your device
3. Run Flutter app ```flutter run -d MOBILE_DEVICE_NAME```
4. Download and Install [Python](https://www.python.org/downloads/)
5. Install Tensorflow using pip ```pip install tensorflow```

## Conclusion

Despite facing various challenges, the Spring Bird team successfully developed a Plastic-Free Shopping Assistant that aligns with the Sustainable Development Goals and aims to combat plastic pollution through informed consumer choices. By leveraging modern technologies and a commitment to sustainability, Spring Bird strives to contribute to a healthier planet for all.

**Join us in our mission to make sustainable shopping a reality!**

### Thanking You 😇
