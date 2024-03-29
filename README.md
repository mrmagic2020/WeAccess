# WeAccess

<div align="center">

<img src="https://github.com/mrmagic2020/WeAccess/blob/main/Assets/ApplicationStub.png?raw=true" width="100" alt="Logo">

A simple workflow to enable the use of WeChat for Mac on restricted devices.

![GitHub last commit](https://img.shields.io/github/last-commit/mrmagic2020/WeAccess)
![GitHub commits since latest release](https://img.shields.io/github/commits-since/mrmagic2020/WeAccess/latest)
![GitHub Release Date](https://img.shields.io/github/release-date/mrmagic2020/WeAccess)

</div>

## Background

Due to some inappropriate activities involving the social media app WeChat, the app has been banned on our school-issued computers, resulting in this:

<img src="https://github.com/mrmagic2020/WeAccess/blob/main/Assets/ban_message.jpg?raw=true" width="500" alt="Restriction Message">

After rounds of debugging, trials and errors, I figured out the identifier the system uses to detect this app. For more details on how this works, see [How it Works](#how-it-works).

## How to Use

1. Download the latest release [here](https://github.com/mrmagic2020/WeAccess/latest).

2. Ensure that you have WeChat installed and ready in the `Applications` folder. Do NOT open it. You may use the provided copy of WeChat. It is directly downloaded from the [official website](https://mac.weixin.qq.com/?lang=en), and might not be up to date.

3. Run `MagicWeChat`. You might need to **right-click and select `Open`** to bypass Gatekeeper. Select `Open` when prompted.

    <img src="https://github.com/mrmagic2020/WeAccess/blob/main/Assets/Image%201.png?raw=true" width="300" alt="Image 1">
    <img src="https://github.com/mrmagic2020/WeAccess/blob/main/Assets/Image%202.png?raw=true" width="200" alt="Image 2">

4. Enter your password as required. This is necessary for force resigning the app after modification.

    > This workflow does NOT connect to the internet or attempt to store any data. You may disconnect the Internet or use a firewall to ensure this.

    <img src="https://github.com/mrmagic2020/WeAccess/blob/main/Assets/Image%203.png?raw=true" width="300" alt="Image 3">

5. Allow up to 10 seconds after entering the password, as re-signing the app may take some time.

6. Finally, a popup window will inform you that the process has been completed. Right-click and open `WeChat` to bypass Gatekeeper.

7. Use as usual. Note that you will not be able to update the app directly. If an update is desired, you will need to reinstall the app and repeat this process.

Please support us by `starring` this repository. Your support is hight appreciated! 🌟

## How it Works

- Observation: For most restricted apps, changing their `name`s would typically solve the problem. However, this doesn't work for WeChat. The system uses other identifier(s) to detect this app.
- Observation: Changing an application's name does not affect the displayed name in `Activity Monitor`. Therefore, the name displayed is decided by the name of the `executable file`, which might be one of the targeted identifiers.

  - Note that we cannot just change the executable name. Doing so will prevent the program from locating the executable, thus breaking it.
  - Therefore, we look into `Contents/Info.plist`, where we notice `CFBundleDisplayName` and `CFBundleExecutable` attributes, which are both set to  "WeChat".
  - Changing both these attributes in accordance with the executable name should work.

- Observation: Two error pops up after the operation:

  1. The application "WeChat" cannot be opened.

  2. WeChat is restricted!

  - The first error indicates that after modification, the app needs to be re-signed.

  - The second error tells us that the system is still able to detect this app!

- Observation: In `Info.plist`, another attribute that stands out is `CFBundleIdentifier`. This is the only other attribute that is unique for an application.

  - We change `CFBundleIdentifier`, and re-sign the app.

  - Voilà! Now the system cannot detect the app, and we can use it with no issues by bypassing Gatekeeper (right click -> open).

We decide to make this workflow into an app to make the process (and updating the app) easier. And that's the origin of this project.
