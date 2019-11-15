import 'package:applichic/components/appbar.dart';
import 'package:applichic/components/article/body.dart';
import 'package:applichic/components/article/code.dart';
import 'package:applichic/components/article/image.dart';
import 'package:applichic/components/article/link.dart';
import 'package:applichic/components/article/separator.dart';
import 'package:applichic/components/article/subtitle.dart';
import 'package:applichic/components/article/text.dart';
import 'package:applichic/components/article/title.dart';
import 'package:applichic/components/article/title1.dart';
import 'package:flutter/material.dart';

class GoogleTranslatePart1Article extends StatefulWidget {
  @override
  _GoogleTranslatePart1ArticleState createState() =>
      _GoogleTranslatePart1ArticleState();
}

class _GoogleTranslatePart1ArticleState
    extends State<GoogleTranslatePart1Article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: ACBody(
        children: <Widget>[
          ACTitle(
            text: "Flutter: Google Translate part 1",
          ),
          ACSubTitle(
            text: "Make the design",
            margin: const EdgeInsets.only(top: 8),
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part1/first_image.png",
          ),
          ACTitle1(
            text: "What is Flutter?",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "Flutter is an open-source technology created by Google. Used to develop awesome mobile applications for Android and IOS. It is easier to learn Flutter than both native technologies. Thanks to it’s cross platform technology, your mobile development benefits a faster development process.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Dart",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "Once again, created by Google, Dart is a typed and object-orientated language which is transcompiled into Javascript. It is mainly used to develop mobile and web applications.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Getting started",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "We are going to develop together the Google Translate application for Android and IOS with Flutter. This is how our application will look like.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/second_image.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "Considering that your Flutter SDK is already installed and configured on your computer for the following part. If it’s not done yet, you must follow the instructions on the official Flutter website below.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://flutter.io/docs/get-started/install",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Creating the project",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "To create the project we have to run Android Studio and click on “Start a new Flutter project” and then select “Flutter application”. We fill the form with the project name, the path to the flutter SDK, the project location and a description as below.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/third_image.png",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Clean the code",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "Once the project is created we start by cleaning the code generated in the main.dart file. Some code is already created but we to keep it as simple as possible.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Translate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[600],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Translate'),
          elevation: 0.0,
        ),
        body: Center(
          child: Text("We are going to translate everything !"),
        ),
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "It’s way cleaner, and easier to understand the code. The MaterialApp class defines the material design look to our application. Let’s add a blue theme in the ThemeData class in order to be closer of the real Google Translate application. Scaffold create the global structure of the application, an AppBar and the body. The body part is the place in which we will display the content of our application under the AppBar.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Organize the code",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/fourth_image.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The code is oranized this way to separate my components, screens, models and services. This is a way to organize code but it also exists different ones. The test folder is organized the same way.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Create our first component",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "We are going to create our first component to display the language in which we have to write our text and the language in which we will translate it.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';
class ChooseLanguage extends StatefulWidget {
  ChooseLanguage({Key key}) : super(key: key);  
  
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {  
  String _firstLanguage = "English";
  String _secondLanguage = "French";  
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "This code creates a ChooseLanguage component. We created two variables that will display the chosen languages.",
          ),
          ACSeparator(margin: const EdgeInsets.only(top: 32)),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """@override
Widget build(BuildContext context) {
  return Container(
    height: 55.0,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          width: 0.5,
          color: Colors.grey[500],
        ),
      ),
    ),
  );
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We define a specific height and a decoration to our container to style the component. In the BoxDecoration, we define the background color and the container’s border to show a visual separation at the bottom of our component.",
          ),
          ACSeparator(margin: const EdgeInsets.only(top: 32)),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "Now we are going to add a Row element that will help us to display our widgets on a line. We will then have the possibility to determine how we are going to align the elements in this line. Indeed, a row has two axes, the main axis that goes in the same direction as the row axis and the cross axis that cross its direction. Manipulating both of them, we can display our components the way we want quite easily. The following schema shows the evolution of how the widgets are going to display with the different properties.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/fifth_image.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "It is very easy to recreate this display in Flutter, all we need is a Row element and defining the main and cross-axis alignment. The Expanded elements are going to be added in the Row’s children.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """@override
Widget build(BuildContext context) {
  return Container(
    ...
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ...
      ],
    ),
  );
}""",
          ),
          ACSeparator(margin: const EdgeInsets.only(top: 32)),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "It’s now time to add the widgets inside our Row. For that, we will need to simply create a Text component inside an InkWell component. The InkWell component will create a zone around the text that will be clickable and display a splash effect.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              this._firstLanguage,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    ),
    ...
    Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              this._secondLanguage,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
),""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We found our Expanded element for our both Text that contains a Material with a white background color. The InkWell element needs a Material in the subtree to display the splash effects. The onTap isn’t used for now, we will use it later to change the language when we click on the Text. We display the Text into a Center class because the Expanded will take all the space and we want to center the text. Finally, we added our variables firstLanguage and secondLanguage to display the languages.",
          ),
          ACSeparator(margin: const EdgeInsets.only(top: 32)),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The last step is creating an icon button to switch the languages like in the real Google Translate application. It is very simple, as for the text we will create a Material with a white background that will contain our IconButton . We choose our icon in the icon list already present in the Flutter library. I have chosen to use the Icons.compare_arrows which is not exactly the same as in the real application.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """<Widget>[
  Expanded(
    ...  
  ),
  Material(
    color: Colors.white,
    child: IconButton(
      icon: Icon(
        Icons.compare_arrows,
        color: Colors.grey[700],
      ),
      onPressed: () {},
    ),
  ),
  Expanded(
    ...  
  ),
]""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "Well done! Now our component is finally done, we have to add it in our screen page. And then we should be able to observe a result close to the one I will show.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';

import '../components/choose-language.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          ChooseLanguage(),
      ),
    );
  }
}""",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/sixth_image.gif",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Translate actions UI",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "We should now create the component to choose the texts we will want to translate. In the Google application, we must write a text or use different features such as taking a photo. We are following the same design as in the iOS application. Accordingly, we will create clickable widgets which will trigger actions in the next parts of this tutorial.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/seventh_image.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We will create the component with this structure using the Columnand Row to display our UI. The Column works the same way as the Row, the only difference is the direction in which it displays our elements. We are going to code now in a new component the structure we want to achieve.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';

class TranslateText extends StatefulWidget {
  TranslateText({Key key}) : super(key: key);

  @override
  _TranslateTextState createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(0.0),
      elevation: 2.0,
      child: Container(
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(...),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Material(
                  color: Colors.white,
                  child: Column(
                     children: <Widget>[...],
                   ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We are also defining the main and cross axis aligment for our Columnand Row. Here we chose the MainAxisAlignment.spaceBetween because we want to have some space between our clickable icons.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "Since the structure is coded we can now focus on the input part. The input part is not a widget in which we will write text. In the real application when we click on this part, an input appears to write our text.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class _TranslateTextState extends State<TranslateText> {
  @override
  Widget build(BuildContext context) {
    return Card(
      ...,
      child: Container(
        height: 150.0,
        child: Column(
          ...,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 16.0, 
                    right: 16.0, 
                    top: 16.0
                  ),
                  child: Text(
                    "Enter text",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
            Row(...),
          ],
        ),
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The code is very similar to the first component we created. It is simply a Text inside of an InkWell. We are keeping the onTap function for later as we did in the first component we created. We have now to create the clickable icons in the Row.",
          ),
          ACSeparator(margin: const EdgeInsets.only(top: 32)),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We are going to use the same code to display the 4 icons with its descriptive text. We could just write 4 times the same code in the Row nevertheless we are going to duplicate the code if we do so.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "With this method we will have to change the code as many times as we duplicated it. The best solution is to create another component that we will call four times with different arguments.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Creation of a clickable icon",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  ActionButton({Key key, this.icon, this.text, this.imageIcon}) : super(key: key);

  final IconData icon;
  final AssetImage imageIcon;
  final String text;

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: FlatButton(
        padding: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          top: 2.0,
          bottom: 2.0,
        ),
        onPressed: () {},
        child: Column(
          children: <Widget>[...],
        ),
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We called our new component ActionButton and unlike the others we added arguments icon, imageIcon and text. Some of the icons I used were not in the Google Library so I created my owns.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "That’s why I make the difference between icon and ImageIcon. We are going to create a function to display the icon from an IconData or an AssetImage.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """Widget _displayIcon() {
  if (this.widget.icon != null) {
    return Icon(
      this.widget.icon,
      size: 23.0,
      color: Colors.blue[800],
    );
  } else if (this.widget.imageIcon != null) {
    return ImageIcon(
      this.widget.imageIcon,
      size: 23.0,
      color: Colors.blue[800],
    );
  } else {
    return Container();
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "This function check if the icon or the imageIcon variables are null, when one of the both isn’t then we display the image with it’s right component. Indeed we display IconData thanks to the Icon component. The AssetImage thanks to the ImageIcon component. I also added the possibility than not any of them is declared, in which we are going to display an empty Container.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """@override
Widget build(BuildContext context) {
  return Material(
    color: Colors.white,
    child: FlatButton(
      ...,
      child: Column(
        children: <Widget>[
          _displayIcon(),
          Text(
            this.widget.text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We added the _displayIcon function in our Column right behind the text. It will display the right widget from the icon or the image icon we are going to pass to our component. We can call now our component in the TranslateText we created earlier.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';

import 'ActionButton.dart';

class _TranslateTextState extends State<TranslateText> {
  @override
  Widget build(BuildContext context) {
    return Card(
      ...,
      child: Container(
        height: 150.0,
        child: Column(
          ...,
          children: <Widget>[
            Expanded(
              ...,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ActionButton(
                  icon: Icons.camera_alt,
                  text: "Camera",
                ),
                ActionButton(
                  imageIcon: AssetImage("assets/pen.png"),
                  text: "Handwriting",
                ),
                ActionButton(
                  imageIcon: AssetImage("assets/conversation.png"),
                  text: "Conversation",
                ),
                ActionButton(
                  icon: Icons.keyboard_voice,
                  text: "Voice",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We imported our component and we called ActionButton 4 times with different arguments to have a unique render for each ActionButton but still the same code.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Add assets images (optionnal)",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "I added my own images in some buttons we just made but we need to change the file pubspec.yaml in the root folder to display these images.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "I added the “- assets/” in the pubspec.yaml file and created an assets folder in the root folder with my images. When this is done you might need to rerun the application. Finally, you could call your images like I did before, for exemple: AssetImage(\"assets/pen.png\").",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "If you want to know more about assets and how we can use them, I invite you to read the excellent Flutter documentation below.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://flutter.io/docs/development/ui/assets-and-images",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Looking at our work",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "The second component is completed, the application’s UI is almost done now.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/eighth_image.gif",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Display the list of last translates",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "We need to create again a new component to display the list of the last translates we did. Still using the same principle, we will develop a widget combining rows and columns. The List will display our items like a Column does except that it will be automatized without adding `n` times the components. Furthermore, it will display a scrolling on the list.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/ninth_image.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "First of all, I define a Translate class which is composed of the elements we will need to display the items in our list.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class Translate {
  String text;
  String translatedText;
  bool isStarred;

  Translate(String text, String translated, bool isStarred) {
    this.text = text;
    this.translatedText = translated;
    this.isStarred = isStarred;
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "Since the Translate class is created we can create our new component that I called `ListTranslate`. We define the number of lines the ListView is going to display in ItemCount. In ItemBuilder we display the rows with our array list.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';
import '../models/translate.dart';

class ListTranslate extends StatefulWidget {
  ListTranslate({Key key}) : super(key: key);

  @override
  _ListTranslateState createState() => _ListTranslateState();
}

class _ListTranslateState extends State<ListTranslate> {
  List<Translate> _items = [];  Widget _displayCard(int index) {
    return Card(
      child: Container(
      ),
    );
  }  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return _displayCard(index);
        },
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The next step is to create the list’s items like in the sketch we made earlier. To do so, we are going to use Row and Column as we did for the last components. Nevertheless, we are going to add some style like a border radius, margin and padding to give it a better style.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """Widget _displayCard(int index) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
    ),
    margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.5),
    child: Container(
      height: 80.0,
      padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  _items[index].text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  _items[index].translatedText,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_border,
              size: 23.0,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    ),
  );
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "It displays now each rows in our list with the information we will find in our list. The Flexible widget extends it’s height and width to the maximum. If our texts are too long they are going to be cut at the end thanks to the maxLine and overflow we added in the Text.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """IconButton(
  onPressed: () {},
  icon: Icon(
    _items[index].isStarred ? Icons.star : Icons.star_border,
    size: 23.0,
    color: _items[index].isStarred ? Colors.blue[600] : Colors.grey[700],
  ),
),""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We want to change the color and the icon if the row’s element has been starred. We use the ternary operators to change it directly from the list information.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """List<Translate> _items = [
  Translate(
    "yellowish",
    "jaunâtre",
    true,
  ),  ...,
];""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "We fill the list’s items with arbitraty information to see how it is going to looks like. And now, the design is finally completed, we can observe the work we made during all this session.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32),
            url: "assets/articles/google_translate_part1/tenth_image.gif",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Conclusion",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "It shows how easy and fast it is to create a mobile application for Android and IOS with Flutter. We find also some parts that look like flexbox in the web development. Even if it’s a development very specific to mobile, web developers could find similarities with what they know. We only did a basic application without any features yet but it’s not going to be harder to code the next parts !",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "This is my first article and english isn’t my main language. I hope you will be comprehensive with the mistakes I surely did. It’s an exercise I wanted to do to improve my english and share with you what I know about Flutter. Share a technology I fell in love with. Thanks.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Github Link",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text:
                "https://github.com/Appli-chic/google-translate-flutter/tree/part-1",
          ),
        ],
      ),
    );
  }
}
