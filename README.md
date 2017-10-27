# My Vibe

Welcome to the **MyVibe** iOS app repository.

## Team

- [Piotr Torczyński](mailto:piotr.torczynski@gmail.com) – iOS Developer

## Project

Application supports **iOS 10.0** or higher and every compatible iPhone.

## Tools & Requirements

Project is written in **Swift 4.0** and requires the following tools to be installed:

- **[Xcode](https://github.com/KrauseFx/xcode-install) 9.0** using the latest **iOS 11 SDK**,
- **[Carthage](https://github.com/Carthage/Carthage) 0.25** or higher,
- **[CocoaPods](https://github.com/CocoaPods/CocoaPods) 1.2.1** or higher,
- **[CocoaPods-Keys](https://github.com/orta/cocoapods-keys) 2.0.0** or higher.

## Configuration

Assuming the above requirements are met and the repository is cloned:

1. Create appropriate `.env` file into the project's directory, which contains `APIToken` that will be used in to establish proper connection with API.

```swift
    APIToken=YOUR_API_TOKEN
```

2. Install CocoaPods keys:

    ```sh
    $ pod install
    ```

3. Install Carthage dependencies:

    ```sh
    $ carthage bootstrap --platform iOS --cache-builds
    ```

4. Open `MyVibe.xcodeproj` and build the project!
