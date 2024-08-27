# Flutter Simple Typewriter

`flutter_simple_typewriter` is a Flutter package for creating a typewriter effect in text fields. It animates text by typing it character by character, and can also backspace to simulate typing correction. This is particularly useful for search bars, login screens, or any text input fields that require engaging and dynamic text prompts.

## Features

- **Typewriter Animation**: Simulate typing and backspacing effects in any `TextFormField`.
- **Customizable Speed**: Control the speed of typing and backspacing.
- **Loop through Queries**: Automatically cycles through a list of search queries or prompts.
- **Pause and Resume**: Customize delay before the next action (typing or backspacing).

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_simple_typewriter: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

To use `flutter_simple_typewriter`, you just need to import it and use the `AnimatedTextFormField` widget in your widget tree.

### Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_simple_typewriter/flutter_simple_typewriter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Typewriter Example')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedTextFormField(
              searchQueries: ['Flutter', 'Dart', 'Typewriter Effect'],
              typeSpeed: Duration(milliseconds: 150),
              backspaceSpeed: Duration(milliseconds: 100),
              delay: Duration(seconds: 1),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### Parameters

- `searchQueries` (List<String>): List of strings that the typewriter will cycle through. **Required**.
- `typeSpeed` (Duration): Speed of typing. Defaults to `Duration(milliseconds: 150)`.
- `backspaceSpeed` (Duration): Speed of backspacing. Defaults to `Duration(milliseconds: 100)`.
- `delay` (Duration): Delay before starting the next query or action. Defaults to `Duration(seconds: 1)`.

### Optional Parameters

`AnimatedTextFormField` also accepts all standard `TextFormField` parameters for full customization of the text input field.

For example:
- `controller`
- `focusNode`
- `decoration`
- `keyboardType`
- `textInputAction`
- `style`
- `strutStyle`
- `textAlign`
- `textAlignVertical`
- `autofocus`
- `readOnly`
- `enabled`
- `maxLines`
- `minLines`
- `expands`
- `maxLength`
- `obscureText`
- `autocorrect`
- `smartDashesType`
- `smartQuotesType`
- `textCapitalization`
- `enableSuggestions`
- `onChanged`
- `onTap`
- `onEditingComplete`
- `onFieldSubmitted`
- `onSaved`
- `validator`
- `inputFormatters`
- `enableInteractiveSelection`
- `buildCounter`
- `scrollPhysics`
- `scrollController`
- `initialValue`
- `autovalidateMode`
- `mouseCursor`
- `contextMenuBuilder`
- `onTapOutside`

## Contributions

Contributions are welcome! Please open an issue or submit a pull request with any features, bug fixes, or ideas.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README provides an overview of the package, how to install and use it, and a list of customizable parameters that correspond to your Flutter widget.