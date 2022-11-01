# Omicron Mobile Application

This is the omicron mobile application used to control the omicron mobile platform. We intend to increase its capabilities to control other mobile robots. With this application, we ensure that we get the control signals informing of roll, yaw, and pitch from the mobile phone accelerometer and the joystick inbuilt into the applications. These signals are then sent via WebSocket, MQTT, or HTTP to your broker or mobile platform. The figure below shows the mobile application architecture of the robotic system

![Mobile App Architecture](utils/omicronmobileapparchitecture.jpg)

## App preview

![Welcome](utils/OmicronAppWelcome.jpg)
![Setup](utils/OmicronAppSetup.jpg)
![Control](utils/OmicronAppControl.jpg)

## Installation

- Add [Flutter](https://flutter.dev/docs/get-started/install) to your machine

- Open this project folder with Terminal/CMD and run `flutter pub get`

- Run `flutter run` to build and run the debug app on your emulator/phone

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Todos

- [x] Welcome Screen
- [x] Setup Screen
- [x] Control Screen
- [x] Add validation on the setup screen
- [x] Establish HTTP, ws or MQTT connection to the endpoint from setup
- [x] Setup pages for the privacy policy
- [x] Setup pages for guides
- [x] Get roll, yaw and pitch values from the joystick
- [ ] Get roll, yaw and pitch values from mobile phone accelerometer
- [x] Send roll, yaw and pitch values
- [ ] Setup starts recording commands for a replay
- [ ] Setup stop recording commands for a replay
- [ ] Setup replay for stored command
- [ ] Setup CI/CD [Ref](https://levelup.gitconnected.com/ci-cd-for-flutter-using-github-actions-and-fastlane-6dfc9431ee9a)

## Thanks

- [Flutter](https://flutter.dev) for the great cross-platform framework

## License

See [LICENSE](LICENSE).
