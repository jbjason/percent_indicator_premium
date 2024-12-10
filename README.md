# percent_indicator_premium
 
<img width=30% height=14% src="">  
This is a simple yet highly customizable package for all kind of users.

## Features

- 🛠️ **Circular Progress Indicators**: Create visually appealing circular progress indicators with customizable colors, sizes, and percentages.
- 🔢 **Vertical Progress Indicators**: Build sleek and modern Vertical progress indicators for various use cases.
- 🔢 **Horizonal Progress Indicators**: Build sleek and modern Horizonal progress indicators for various use cases.
- 🔢 **Square Progress Indicators**: Build sleek and modern Square progress indicators for various use cases.
- ⌨️ **Custom Widgets**: Easily embed icons, text, or other widgets into the center of your indicators.
- 🔐 **Lightweight and Fast**: Optimized for performance, ensuring seamless usage in your apps.

## Installation

Add the following line to your `pubspec.yaml`:

```dart
dependencies:
  percent_indicator_premium: ^0.0.1  //Run flutter pub get to install the package.
```

## Usage
Here's a quick example to get started:

### Horizontal percent indicator
```dart
HorizontalPercentIndicator(
    this.height = 30,
    this.width,
    this.borderRadius = 8,
    required this.loadingPercent,
    this.inactiveTrackColor = MyColor.inActiveColor,
    this.child,
    this.activeTrackColor = const [MyColor.skyPrimary, MyColor.skySecondary],
),
```
### Square percent indicator
```dart
VerticalPercentIndicator(
    this.height = 120,
    this.width = 30,
    this.borderRadius = 8,
    required this.loadingPercent,
    this.inactiveTrackColor = MyColor.inActiveColor,
    this.child,
    this.activeTrackColor = const [MyColor.skyPrimary, MyColor.skySecondary],
),
```

### Square percent indicator
```dart
CircularPercentIndicator(
    this.height = 150,
    this.width = 150,
    required this.loadingPercent,
    this.inActiveTrackColor = MyColor.inActiveColor,
    this.child,
    this.activeTrackColor = const [
      Colors.deepOrangeAccent,
      Colors.greenAccent,
      Color(0xFF913A84),
      Colors.deepOrangeAccent
    ],
),
```


### Square percent indicator
```dart
SquarePercentIndicator(
    this.height = 150,
    this.width = 150,
    required this.loadingPercent,
    this.borderRadius = 12,
    this.indicatorColor = MyColor.skyPrimary,
    this.backColor = MyColor.inActiveColor,
    this.child
),
```


### Square percent indicator
```dart
SquarePercentIndicator(
    this.height = 150,
    this.width = 150,
    required this.loadingPercent,
    this.borderRadius = 12,
    this.indicatorColor = MyColor.skyPrimary,
    this.backColor = MyColor.inActiveColor,
    this.child
),
```

## Parameters

```dart
  // for horizontal percent indicator
  HorizontalPercentIndicator{
    final double height;
    final double? width;
    final double borderRadius;
    final double loadingPercent;
    final Color inactiveTrackColor;
    // child you want to put infront of your percent indicator, Percent-text is shown by default 
    final Widget? child;
    // you can set multiple colors if you want
    final List<Color> activeTrackColor;
  }
  // for vertical percent indicator
  VerticalPercentIndicator{
    final double height;
    final double width;
    final double borderRadius;
    final double loadingPercent;
    final Color inactiveTrackColor;
    // child you want to put infront of your percent indicator, Percent-text is shown by default 
    final Widget? child;
    // you can set multiple colors if you want
    final List<Color> activeTrackColor;
  }
 // for circular percent indicator
 CircularPercentIndicator{
   final double height;
   final double width;
   final double loadingPercent;
   final Color inActiveTrackColor;
   // child you want to put infront of your percent indicator, Percent-text is shown by default 
   final Widget? child;
   // you can set multiple colors if you want
   final List<Color> activeTrackColor;
 }
 // for square percent indicator
 SquarePercentIndicator{
    final double height;
    final double width;
    final double loadingPercent;
    final double borderRadius;
    final Color indicatorColor;
    final Color backColor;
    // child you want to put infront of your percent indicator, Percent-text is shown by default 
    final Widget? child;
 }
  
```

## Example
Check out the full example in the [`example`](https://pub.dev/packages/percent_indicator_premium/example) folder.

## License
This project is licensed under the MIT License.


## Support
For questions or suggestions, contact me via jubayeral040@gmail.com.

Check out the documentation on pub.dev for more details.

### Happy coding! 🚀
