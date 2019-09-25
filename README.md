# CardGame
Cards shuffle higher or lower game

### Api Links
- https://cards.davidneal.io/api/cards

### Development Platform
- iOS 12.2 and XCode 10.2.1
- Swift 5

### Targets
- CardGame - Main application target
- CardGameTests - Unit testing target

### Instruction to run
- Download the project from URL or .Zip
- open CardGame.xcodeproj and run in the simulator
[For simpicity I test it in the iPhoneXs, Not tested for the lower devices like iPhone SE]

### Swift architecture
- The application is build with MVVM-C (Model-View-ViewModel and Coordinator) architecture. Use of coordinator pattern for navigation. Therefore viewcontrollers are free from navigation. 
- I used Protocols for each ViewModels so that can be easily Mocked for testing.

### Features
- After launching the application it will make an api call to retrieve cards.
- Tap the start button will show a game view with the shuffled card, First one at the beginning.
- User then able to guess if the card that follows it will be higher or lower.
- There is a Lifeline check, User will get maximum three lifelines.
- Once all the lifeline will be used app will show the result view with the successful guess.
- User can start the game once again.
