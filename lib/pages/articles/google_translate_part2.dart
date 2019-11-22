import 'package:applichic/components/appbar.dart';
import 'package:applichic/components/article/body.dart';
import 'package:applichic/components/article/code.dart';
import 'package:applichic/components/article/image.dart';
import 'package:applichic/components/article/link.dart';
import 'package:applichic/components/article/subtitle.dart';
import 'package:applichic/components/article/text.dart';
import 'package:applichic/components/article/title.dart';
import 'package:applichic/components/article/title1.dart';
import 'package:applichic/components/article/title2.dart';
import 'package:applichic/components/drawer.dart';
import 'package:applichic/projects/google_translate_part2/lib/main.dart';
import 'package:flutter/material.dart';

class GoogleTranslatePart2Article extends StatefulWidget {
  @override
  _GoogleTranslatePart2ArticleState createState() =>
      _GoogleTranslatePart2ArticleState();
}

class _GoogleTranslatePart2ArticleState
    extends State<GoogleTranslatePart2Article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ACDrawer(),
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: ACBody(
        preview: GoogleTranslateAppPart2(),
        children: <Widget>[
          ACTitle(
            text: "Flutter: Google Translate part 2",
          ),
          ACSubTitle(
            text: "Translate our first text",
            margin: const EdgeInsets.only(top: 8),
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Sticky header list overview",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "The actual application can’t select a language. To translate a text from Chinese to French we need to be able to choose the Chinese and French language through a list. As we are still trying to stay close to the real Google Translate application, the languages in the list are split into two categories.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part2/first_image.gif",
          ),
          ACTitle1(
            text: "Creating the language list",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "The language model",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "First of all, the Language class must be created to display different information on each row of the list. The class will contain the language name, the code to translate the sentences and three booleans, is it recent, downloaded or downloadable. These three last booleans are added to respect the design and the features of the actual Google Translate application.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class Language {
  String name;
  String code;
  bool isRecent;
  bool isDownloaded;
  bool isDownloadable;Language(String code, String name, bool isRecent, bool isDownloaded, bool isDownloadable) {
    this.name = name;
    this.code = code;
    this.isRecent = isRecent;
    this.isDownloaded = isDownloaded;
    this.isDownloadable = isDownloadable;
  }
}""",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Creating the language page",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "Since this class is created, the creation of the language page widget can start. This widget has a property title that is going to change from “Translate from” to “Translate to” and a boolean that will determine if we keep the “automatic” language in the list.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class LanguagePage extends StatefulWidget {
  LanguagePage({Key key, this.title, this.isAutomaticEnabled})
      : super(key: key);

  final String title;
  final bool isAutomaticEnabled;
  
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final List<Language> _languageList = [
    Language('auto', 'Automatic', false, false, false),
    Language('fr', 'French', true, true, true),
    ...,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
        ],
      ),
    );
  }
}""",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Search text field",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "It needs to define a TextEditingController to retrieve the text we are writing in the search field. Afterward, this controller is assigned to the TextField created in the build function to create the link. This TextField is composed of the controller, an event triggered when the text is changing and style. When the text is changing, it’s triggering setState to refresh the UI.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class _LanguagePageState extends State<LanguagePage> {
  // Controller instancied
  final TextEditingController _searchTextController = TextEditingController(); 
  final List<Language> _languageList = [...];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
              left: 8.0,
              right: 8.0,
            ),
            child: TextField(
              controller: this._searchTextController,
              onChanged: (text) {
                setState(() {}); // Refresh the UI
              },
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none, // No border
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[600])), // We add this border when the input is focused
                prefixIcon: Icon(
                  Icons.search,
                  size: 24.0,
                  color: Colors.grey,
                ), // Search icon displayed for the style !
              ),
            ),
          ),
        ],
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "To simplify the interactions when the user is searching for a language, the input displays a close icon at the right. The function shows the icon only when the user typed at least one character and reset the text when it is pressed.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text:
                """// Display the delete text icon if we typed text in the search input
Widget _displayDeleteTextIcon() {
  if (this._searchTextController.text.length > 0) {
    return IconButton(
      icon: Icon(Icons.close),
      color: Colors.grey,
      onPressed: () {
        setState(() {
          _searchTextController.text = ""; // Reset the text
        });
      },
    );
  } else {
    return null; // We don't display the icon
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The function added in the suffix icon in the InputDecoration of our TextField and now everything is done!",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """TextField(
  ...,
  decoration: InputDecoration(
    ...,
    suffixIcon: this._displayDeleteTextIcon(), // Added
  ),
),""",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "List with sticky headers",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "To create a list with sticky headers there is a library that simplifies significantly the amount of work. This library is flutter_sticky_header which you can find on the link below.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://pub.dartlang.org/packages/flutter_sticky_header",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text: "Installing the library in the package’s pubspec.yaml",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """dependencies: 
  flutter_sticky_header: ^0.3.4""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The first step is to import the flutter_sticky_header package in the LanguagePage class. The list will be returned by a function because we are keeping in mind that we will also display another list with the filtered languages when the user is typing in the search bar. SliverStickyHeader contains a header and aSliverList. The function returns a CustomScrollView with two SliverStickyHeader that includes two headers with a list for each.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part2/second_image.png",
          ),
          ACCode(
            text:
                """import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class _LanguagePageState extends State<LanguagePage> {
  // Send back the selected language
  _sendBackLanguage(Language language) {
    Navigator.pop(context, language);
  }
  
  // Display the list with headers, means we are not searching
  Widget _displayListWithHeaders() {
    List<Language> recentLanguages =
        this._languageList.where((e) => e.isRecent).toList(); 
    // Create a new list with only the recent languages used

    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverStickyHeader(
            header: Container( // Recent Language header
              height: 60.0,
              color: Colors.blue[600],
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Languages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            sliver: SliverList( // List of recent languages
              delegate: SliverChildBuilderDelegate(
                (context, i) => LanguageListElement(
                      language: recentLanguages[i],
                      onSelect: this._sendBackLanguage,
                    ),
                childCount: recentLanguages.length,
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container( // All languages header
              height: 60.0,
              color: Colors.blue[600],
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'All languages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            sliver: SliverList(// List of all languages
              delegate: SliverChildBuilderDelegate(
                (context, i) => LanguageListElement(
                      language: this._languageList[i],
                      onSelect: this._sendBackLanguage,
                    ),
                childCount: this._languageList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }@override
  Widget build(BuildContext context) {
    return Scaffold(
      ...,
      body: Column(
        children: <Widget>[
          Container(...),
          this._displayListWithHeaders(), // Call the function
        ],
      ),
    );
  }
}""",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Searching in the list",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "The page already contains the search field and the languages list, but the list can’t be filtered yet. Another list must be created which will only include the languages corresponding to the search field’s text. A new function is retrieving the list with the languages filtered.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """// Display the list with header if we are not searching
// Display the list with only languages if we are searching
Widget _displayTheRightList() {
  if (this._searchTextController.text == "") {
    return this._displayListWithHeaders();
  } else {
    return this._displaySearchedList();
  }
}@override
Widget build(BuildContext context) {
  return Scaffold(
    ...,
    body: Column(
      children: <Widget>[
        Container(...),
        this._displayTheRightList(), // Call now this function
      ],
    ),
  );
}""",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Add one last detail",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "The language’s text can be defined as automatic if the user doesn’t know which language he is trying to translate. Nevertheless, it doesn’t make sense to keep the automatic ‘language’ when the user is selecting in which language translating the text.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """@override
void initState() {
  super.initState();// Remove the automatic element if disabled
  if (!this.widget.isAutomaticEnabled) {
    var automaticElement = this
        ._languageList
        .where((language) => language.code == 'auto')
        .toList()[0];
    this._languageList.remove(automaticElement);
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The page is definitively finished! It needs now to be called in our application.",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Call the language page",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "To call the page,Navigator will link the component ChooseLanguage that has been created in the first part of this series. But first, some changes must be made in this component. A new class that contains the language names and their codes which are going to be used for the translation have been created earlier. Everything related to languages in this component will be transformed as a Language class.-",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text:
                """Language _firstLanguage = Language('en', 'English', true, true, true); // Here
Language _secondLanguage = Language('fr', 'French', true, true, true); 

// Here Switch the first and the second language
void _switchLanguage() {
  Language _tmpLanguage = this._firstLanguage; // HeresetState(() {
    this._firstLanguage = this._secondLanguage;
    this._secondLanguage = _tmpLanguage;
  });
}

@override
Widget build(BuildContext context) {
  return Container(
    ...,
    child: Row(
      ...,
      children: <Widget>[
        Expanded(
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
              },
              child: Center(
                child: Text(
                  this._firstLanguage.name, // Here
                  style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Material(...),
        Expanded(
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
              },
              child: Center(
                child: Text(
                  this._secondLanguage.name, // Here
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
    ),
  );
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "To select the first language, a function will call Navigatorn the onTap of the first InkWell. The Navigator is calling the LanguagePage and will display it on another page. It’s important to keep the function asynchronous with the keyword async and call Navigator with the keyword await. Before to attribute the new language, it’s important to check if the language is not null. Indeed, the language can be defined as null if the user goes back to the home screen without selecting any language.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """// Choose a new first language
void _chooseFirstLanguage(String title, bool isAutomaticEnabled) async {
  final language = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LanguagePage(
            title: title,
            isAutomaticEnabled: isAutomaticEnabled,
          ),
    ),
  );
  
  if (language != null) {
    this.setState(() {
      this._firstLanguage = language;
    });
  }
}

@override
Widget build(BuildContext context) {
  return Container(
    ...,
    child: Row(
      ...,
      children: <Widget>[
        Expanded(
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {  
                // Call the function 
                this._chooseFirstLanguage("Translate from", true);        
              },
              child: Center(
                child: Text(
                  this._firstLanguage.name,
                  style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Material(...),
        Expanded(...),
      ],
    ),
  );
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text: "Do the same with the second language.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """// Choose a new second language
void _chooseSecondLanguage(String title, bool isAutomaticEnabled) async {
  final language = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LanguagePage(
            title: title,
            isAutomaticEnabled: isAutomaticEnabled,
          ),
    ),
  );
  
  if (language != null) {
    this.setState(() {
      this._secondLanguage = language;
    });
  }
}

@override
Widget build(BuildContext context) {
  return Container(
    ...,
    child: Row(
      ...,
      children: <Widget>[
        Expanded(...),
        Material(...),
        Expanded(
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                // Call the function with different argumentsthis._chooseSecondLanguage("Translate to", false);
              },
              child: Center(
                child: Text(
                  this._secondLanguage.name,
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
    ),
  );
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "Great job! The user can finally select the two languages! The last step coming is translating the text in another language, we are almost done.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Translate text",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "What would be a Google Translate application without any translation service? This is the last part to implement to get a real translate application. Here a gif representing the result wanted at the end of this part. The animation part is going to be a little extra for people that love when everything looks smooth.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part2/third_image.gif",
          ),
          ACTitle2(
            text: "Create a new widget",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "Let’s create a new widget in which the user will write the text with a real-time translation. This widget will have a few arguments like the language from the text written and the language in which it should be translated. A function from the home page to refresh the UI when the user finished translating some text. The last one is the focus node, it’s going to be attached to the TextField. I noticed that the keyboard wasn’t always displaying correctly, so I’m using the focus node to force the keyboard to show and hide.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part2/fourth_image.png",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';
import '../models/language.dart';

class TranslateInput extends StatefulWidget {
  TranslateInput(
      {Key key,
      this.onCloseClicked,
      this.focusNode,
      this.firstLanguage,
      this.secondLanguage})
      : super(key: key);
      
  final Function(bool) onCloseClicked;
  final FocusNode focusNode;
  final Language firstLanguage;
  final Language secondLanguage;
  
  @override
  _TranslateInputState createState() => _TranslateInputState();
}

class _TranslateInputState extends State<TranslateInput> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        ],
      ),
    );
  }
}""",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Add a TextField",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "The TextField needs a controller like it needed for the search field that had been made earlier. The suffix icon is essential to reset the input and leave the state of translating.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """class _TranslateInputState extends State<TranslateInput> {
  TextEditingController _textEditingController = TextEditingController(); // Add the controller
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: TextField(
                focusNode: this.widget.focusNode,
                controller: this._textEditingController,
                onChanged: (text) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: RawMaterialButton(
                    onPressed: () {
                      if (this._textEditingController.text != "") {
                        this.setState(() {
                          this._textEditingController.clear();
                        });
                      } else {
                        this.widget.onCloseClicked(false);
                      }
                    },
                    child: new Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                    shape: new CircleBorder(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}""",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Add the translation system",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "To translate the text, there is already a dart package that does it very well. It’s called translator, and you can find the link to the package below.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://pub.dartlang.org/packages/translator",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 16),
            text: "Add this to your package’s pubspec.yaml file:",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """dependencies: 
  translator: ^0.1.0+7""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "To translate in real-time the text written, each time the user is changing the text, it’s going to call our translate function. First, the translator package must be imported at the top of the widget. Then call the translator with the original text and the code of the two languages selected. It’s storing the translated text into the variable _textTranslated. The last step is showing this translated text.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text:
                """import 'package:translator/translator.dart';class _TranslateInputState extends State<TranslateInput> {
  String _textTranslated = ""; // Text translated
  GoogleTranslator _translator = new GoogleTranslator(); // Translator
  
  // Translate the text with the codes of the two languages selected
  _onTextChanged(String text) {
    if (text != "") {
      _translator
          .translate(text,
              from: this.widget.firstLanguage.code,
              to: this.widget.secondLanguage.code)
          .then((translatedText) {
        this.setState(() {
          this._textTranslated = translatedText;
        });
      });
    } else {
      this.setState(() {
        this._textTranslated = "";
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: TextField(
                focusNode: this.widget.focusNode,
                controller: this._textEditingController,
                onChanged: this._onTextChanged, // Call the translate function
                decoration: InputDecoration(...),
              ),
            ),
          ),
        ],
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "It’s easy! A Text widget is enough to display the translated text. With a blue font, it’s perfect! It has been the easiest part of this article thanks to the translator package.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """class _TranslateInputState extends State<TranslateInput> {
                  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(...),
          Divider(), // Add a divider
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  this._textTranslated, // The translated text
                  style: TextStyle(color: Colors.blue[700]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}""",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Pass languages data",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "Nevertheless, this new widget isn’t called anywhere yet. Links between the home page, this component and the ChooseLanguage must be done to make everything work.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "First, the home page must have the two languages variables which will change when we are changing the selected languages. A boolean with the text touched which will let us know if we have to display the text input or not. Finally, the focus node I talk earlier to show or hide the keyboard.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The TranslateText widget is now stacked with the TranslateInput we just created. Just one will be shown at once thanks to OffStage widget which shows or hide a widget from a condition. In this case, we are hiding the TranslateText when the user clicked on it.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The function _onLanguageChanged is used to retrieve the new languages selected in the widget ChooseLanguage.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """class _HomePageState extends State<HomePage> {
  bool _isTextTouched = false;
  Language _firstLanguage = Language('en', 'English', true, true, true);
  Language _secondLanguage = Language('fr', 'French', true, true, true);
  FocusNode _textFocusNode = FocusNode();
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    this._textFocusNode.dispose();
    super.dispose();
  }
  
  _onLanguageChanged(Language firstCode, Language secondCode) {
    this.setState(() {
      this._firstLanguage = firstCode;
      this._secondLanguage = secondCode;
    });
  }
  
  // Show or hide the text input
  _onTextTouched(bool isTouched) {
    // FocusScope focus the input to show the keyboard
    if (isTouched) {
      FocusScope.of(context).requestFocus(this._textFocusNode);
    } else {
      FocusScope.of(context).requestFocus(new FocusNode());
    }this.setState(() {
      this._isTextTouched = isTouched;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ...,
      body: Column(
        children: <Widget>[
          ChooseLanguage(
            onLanguageChanged: this._onLanguageChanged, // Added
          ),
          Stack(
            children: <Widget>[
              Offstage(
                offstage: this._isTextTouched,
                child: TranslateText(
                  onTextTouched: this._onTextTouched, // Added
                ),
              ),
              Offstage(
                offstage: !this._isTextTouched,
                child: TranslateInput(
                  onCloseClicked: this._onTextTouched,
                  focusNode: this._textFocusNode,
                  firstLanguage: this._firstLanguage,
                  secondLanguage: this._secondLanguage,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The last thing to do is sending back the languages selected to the home page. Each time the chosen languages are changing, the function onLanguageChanged is triggered to the home page and refresh the UI.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """class ChooseLanguage extends StatefulWidget {
  ChooseLanguage({Key key, this.onLanguageChanged}) : super(key: key);
  final Function(Language firstCode, Language secondCode) onLanguageChanged; 
  // Add this function
  
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  // Switch the first and the second language
  void _switchLanguage() {
    ...this.widget.onLanguageChanged(this._firstLanguage, this._secondLanguage); // Call it there
  }
  
  // Choose a new first language
  void _chooseFirstLanguage(String title, bool isAutomaticEnabled) async {
    ...this.widget.onLanguageChanged(this._firstLanguage, this._secondLanguage); // Call it there
    }
  }
  
  // Choose a new second language
  void _chooseSecondLanguage(String title, bool isAutomaticEnabled) async {
    ...this.widget.onLanguageChanged(this._firstLanguage, this._secondLanguage); // Call it there
    }
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "The application is finished here, the user can now select languages, write texts and get the translations in many languages. The most awesome is that it’s working well on Android and iOS with one single code base! From my experience, Flutter is easy to learn and use give us the opportunity to develop fast and beautiful applications.",
          ),
          ACTitle2(
            margin: const EdgeInsets.only(top: 32),
            text: "Add some animations (optional)",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "On the application, there is a little animation, the AppBar is hiding when the zone to write text is clicked. This animation matches the one on the original iOS application.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "On the home page widget, adding ‘with SingleTickerProviderStateMixin’ is necessary to manage a single animation controller. Then initialize the animation controller with a duration defined.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 32),
            text:
                "Each time the user clicks on the text zone, it will trigger the animation with SizeTween defining the start size and the end size (before and after animation). kToolbarHeight is a constant in Flutter containing the height of the app bar, that’s why we use it as a reference. Finally, this._animation.value.height has the value of the height during the animation.",
          ),
          ACCode(
            margin: const EdgeInsets.only(top: 32),
            text: """class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ...;
  AnimationController _controller;
  Animation _animation;
  
  @override
  void initState() {
    super.initState();
    // Init the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )..addListener(() {
        this.setState(() {});
      });
  }
  
  @override
  void dispose() {
    this._controller.dispose(); 
    // Dispose the animation controller
    this._textFocusNode.dispose();
    super.dispose();
  }

  // Generate animations to enter the text to translate
  _onTextTouched(bool isTouched) {
    Tween _tween = SizeTween(
      begin: Size(0.0, kToolbarHeight),
      end: Size(0.0, 0.0),
    );this._animation = _tween.animate(this._controller);if (isTouched) {
      FocusScope.of(context).requestFocus(this._textFocusNode);
      this._controller.forward(); // Execuate animation
    } else {
      FocusScope.of(context).requestFocus(new FocusNode());
      this._controller.reverse(); // Reverse the animation
    }
    ...
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(this._isTextTouched
            ? this._animation.value.height
            : kToolbarHeight),
        child: AppBar(
          title: Text(widget.title),
          elevation: 0.0,
        ),
      ),
      body: Column(...),
    );
  }
}""",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Conclusion",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
                "This tutorial is ending there, I hope it may help you in any projects or give you an idea of how Flutter is working. You can find the link to my GitHub repository below to see the code.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 32),
            text:
                "https://github.com/Appli-chic/google-translate-flutter/tree/part-2",
          ),
        ],
      ),
    );
  }
}
