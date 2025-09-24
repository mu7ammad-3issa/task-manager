# Task Manager App

Task Manager is a simple and clean mobile application built with Flutter that allows users to view and manage their tasks efficiently. The app fetches tasks from a remote API, displays them in a clear and organized manner, and allows users to view task details and update their completion status.

---

##  APK Download

You can download and install the APK file for this application from the following link:

- **https://drive.google.com/file/d/1rZzxbl3I4jeMdio1mc4aAoowRyZFFytX/view**

*Note: You may need to enable "Install from unknown sources" in your Android settings to install the APK.*

---

## 📸 Screenshots

| Task List Screen | Task Details Screen |
| :---: | :---: |
| *<img width="1080" height="1920" alt="Tasks list" src="https://github.com/user-attachments/assets/fa307847-21c0-493c-aa47-e88afc04ed16" />* | *<img width="1080" height="1920" alt="Task details" src="https://github.com/user-attachments/assets/6de56e3b-2b3c-4f6d-a909-c9f0382be787" />* |


---

## 🚀 How to Run the App

To run this application on your local machine, please follow these steps:

**1. Prerequisites:**
   - Ensure you have the **Flutter SDK** installed on your machine.
   - An emulator/simulator or a physical device to run the app.

**2. Clone the Repository:**
   ```bash
   git clone <your-repository-url>
   cd task-manager
````

**3. Install Dependencies:**
Run the following command in your terminal to fetch all the necessary packages:

```bash
flutter pub get
```

**4. Run the App:**
Execute the following command to build and run the application:

```bash
flutter run
```

The application will launch on your connected device or emulator.

-----

## 🛠️ Tech Choices Explained

This project was built with a focus on creating a scalable, maintainable, and efficient application by leveraging a modern tech stack and following best practices in Flutter development.

### **Core Framework**

  * **Flutter:** Chosen for its cross-platform capabilities, allowing for a single codebase for both Android and iOS, and its rich set of pre-built widgets for building a beautiful and responsive UI.

### **Architecture & State Management**

  * **BLoC (Business Logic Component):** The app uses the `flutter_bloc` package for state management. This pattern was chosen to separate the business logic from the UI, which makes the code more organized, easier to test, and scalable. The `TasksCubit` manages the state of the tasks, handling loading, success, and error states seamlessly.

### **Networking**

  * **Dio & Retrofit:** For handling API requests, `dio` was chosen for its robustness and rich feature set, including interceptors. `retrofit` is used for generating type-safe network code, which simplifies the process of making API calls and parsing responses.
  * **`pretty_dio_logger`:** This interceptor was used during development to log network requests and responses, which is incredibly helpful for debugging.

### **Dependency Injection**

  * **GetIt:** The `get_it` package is used as a service locator for dependency injection. This helps in decoupling the app's components and makes it easier to manage dependencies and mock them for testing.

### **Data Serialization**

  * **`json_serializable` & `freezed`:** These packages are used to automate the process of converting JSON data from the API into Dart objects. `freezed` is particularly useful for creating immutable data models and sealed classes, which helps prevent bugs.

### **UI & UX**

  * **`flutter_screenutil`:** This package is used to make the UI responsive across different screen sizes and densities, ensuring a consistent user experience.
  * **`cached_network_image`:** Used for loading and caching network images to improve performance and reduce network usage.
  * **`google_fonts`:** Provides easy access to a wide variety of fonts to enhance the app's typography.

### **Secure Storage**

  * **`flutter_secure_storage`:** Used to securely store the API key, ensuring that sensitive information is not exposed.

<!-- end list -->

```
```
