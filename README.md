# Islami App 🌙📖

The **Islami App** is a beautifully designed Flutter application offering Islamic content to users, including the Quran, Hadith, Quran Radio, Tasbeeh, and customizable settings such as localization and theming. The app is built using **Provider** for state management and adheres to clean code architecture for scalability and maintainability.

---

## Features ✨

### 1. **Quran**
- Access all 114 surahs of the Quran.
- Select and read any surah directly from the app.
- Data is fetched from local JSON files.

### 2. **Hadith Sharif**
- Browse 50 authentic hadiths.
- Select and read each hadith.
- Data is loaded from local JSON files.

### 3. **Quran Radio**
- Stream Quran recitations live from various reciters around the globe.
- The radio uses an **API** to fetch live MP3 streams.

### 4. **Tasbeeh (Animated)**
- An interactive digital tasbeeh for dhikr.
- Tasbeeh count updates dynamically with every tap.

### 5. **Settings**
- Localization support for multiple languages.
- Theme customization (light/dark modes).
- Settings are managed using **Provider** for state management.

---

## Project Structure 📂

Below is the folder structure of the project:

### Key Files:
- `api`: Includes the **API manager** and services for fetching radio streams.
- `home`: Contains the tabs and their respective UI and logic.
  - Quran
  - Hadith
  - Radio
  - Tasbeeh
  - Settings
- `l10n`: Handles localization support for different languages.
- `providers`: Contains `ChangeNotifier` classes for managing app state, such as theme and localization.
- `utils`: Utility files like `AppColors`, constants, and helpers.

---

## Tech Stack 🛠️

- **Flutter**: For building the cross-platform mobile app.
- **Provider**: For state management.
- **Google Fonts**: For beautiful typography.
- **Localization**: For multi-language support.
- **Theming**: Light and dark themes.
- **API Integration**: For Quran radio streams.

---

## video  📸


