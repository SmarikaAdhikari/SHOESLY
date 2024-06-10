SHOESLY

Shoesly is a Flutter-based mobile application designed for shopping. This repository includes the project setup, key features, assumptions made during development, challenges faced, and any additional features or improvements.

Table of Contents

Project Setup Instructions
Assumptions Made During Development
Challenges Faced and Solutions
Additional Features and Improvements

Project Setup Instructions

To set up this project on your local machine, follow these steps:

Clone the repository:

git clone https://github.com/your-SmarikaAdhikari/shoesly.git
cd shoesly
Install dependencies:

Ensure you have Flutter installed. Then, run:

flutter pub get
Run the application:

Connect your device or start an emulator and run:
flutter run

Assumptions Made During Development

User Authentication:Assumed users will authenticate using email and password.

Product Data:Used mock data for products and reviews as no backend was specified.
Design Specifications: Followed a minimalist design approach for user interfaces to keep the app simple and functional.

State Management:
Used Riverpod for state management considering its robustness and ease of use.

Challenges Faced and Solutions

State Management:
Challenge: Managing state across different screens and components.
Solution: Implemented Riverpod to handle state management efficiently.

Dynamic UI Updates:
Challenge: Updating UI elements like the cart and wishlist dynamically based on user actions.
Solution: Utilized Riverpod’s state notifiers to manage and update the UI seamlessly.
Additional Features and Improvements

UI Enhancements: Made several UI improvements for a better user experience, including dynamic color changes and better layout designs.
