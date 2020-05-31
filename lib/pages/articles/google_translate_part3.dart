import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import '../../components/article/body.dart';
import '../../components/article/code.dart';
import '../../components/article/image.dart';
import '../../components/article/link.dart';
import '../../components/article/spacer.dart';
import '../../components/article/subtitle.dart';
import '../../components/article/text.dart';
import '../../components/article/title.dart';
import '../../components/article/title1.dart';
import '../../components/drawer.dart';

class GoogleTranslatePart3Article extends StatefulWidget {
  @override
  _GoogleTranslatePart3ArticleState createState() =>
      _GoogleTranslatePart3ArticleState();
}

class _GoogleTranslatePart3ArticleState
    extends State<GoogleTranslatePart3Article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ACDrawer(),
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: ACBody(
        isPreviewDisabled: true,
        children: [
          ACTitle(
            text: "Flutter: Google Translate part 3",
          ),
          ACSubTitle(
            text: "Voice recognition with translation",
            margin: const EdgeInsets.only(top: 8),
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/google_translate_part_3.png",
          ),
//          ACVideo(
//            margin: const EdgeInsets.only(top: 32, bottom: 32),
//            url: 'assets/articles/google_translate_part3/video.mp4',
//          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "Read the article also on medium:",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://blog.usejournal.com/flutter-google-translate-part-2-3374ecdb8aa0",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "In this third part we will develop the voice recognition to translate your speech and translate a conversation between two persons. Before starting, I refactored part of the code, adding Providers to simplify the way we are passing the data between widgets and screens.",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Refactoring",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "First, we need to download the Provider library here:",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://pub.dev/packages/provider",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "Second, we add a file called translate_provider.dart which will keep information like the selected languages; the text translated and if we are translating it. We are considering French and English are the selected languages when we are opening the app.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """import 'package:flutter/material.dart';
import 'package:google_translate/models/language.dart';

class TranslateProvider with ChangeNotifier {
  bool _isTranslating = false;
  String _textToTranslate = "";
  Language _firstLanguage = Language('fr', 'French', true, true, true);
  Language _secondLanguage = Language('en', 'English', true, true, true);
  
setIsTranslating(bool isTranslating) {
    _isTranslating = isTranslating;
    notifyListeners();
  }
  
setTextToTranslate(String text) {
    _textToTranslate = text;
    notifyListeners();
  }
  
changeLanguages(Language firstLanguage, Language secondLanguage) {
    _firstLanguage = firstLanguage;
    _secondLanguage = secondLanguage;
notifyListeners();
  }
  
Language get firstLanguage => _firstLanguage;

Language get secondLanguage => _secondLanguage;

bool get isTranslating => _isTranslating;

String get textToTranslate => _textToTranslate;
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "Now, we must tell to our application which providers we are using. To do so, we will declare the provider in a Widget called MultiProvider before the Widget MaterialApp in our main.dart.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TranslateProvider>.value(
          value: TranslateProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google Translate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue[600],
        ),
        home: HomePage(title: 'Google Translate'),
      ),
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "This being done, we can now call the provider in any Widget descending of our MaterialApp with the data stored in it. Be careful, most of the time, we must call the Provider.of in the Build function, it won’t work in the initState one.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """@override
Widget build(BuildContext context) {
  _translateProvider = Provider.of<TranslateProvider>(context, listen: true);""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "If you want to learn more about the Providers, explained a better way than I can do, then I recommend you to read this article:",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://medium.com/flutter-community/flutter-statemanagement-with-provider-ee251bbc5ac1",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Voice Recognition",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "The first screen we will create is the one that shows the text from our speech. When the voice activity isn’t recognizing any words for 3 seconds straight, then we leave this page to show the entire text translated.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part3/screenshot_record.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "We will use the dart library called speech_to_text to record the voice as a text. Then we will translate this text using the code on the home page we already developed in the previous article.",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://pub.dev/packages/speech_to_text",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "To start, we are declaring the _speech variable that we will use to listen to the speech in a selected language. Then a timer which will stop the voice recording after 3 seconds. The text variable contains the speech. Don’t forget to cancel the timer and the speech detection in the deactivate function to make sure it doesn’t continue to run in background.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class _RecordPageState extends State<RecordPage> {
  TranslateProvider _translateProvider;
  var _speech = SpeechToText();
  Timer _timer;
  String _speechText = "";
  
@override
  void initState() {
    super.initState();
    _initSpeechToText();
  }
  
@override
  void deactivate() {
    _timer.cancel();
    _speech.cancel();
    _speech.stop();
    
super.deactivate();
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "We declare now our function to start the speech recognition. _speech.initialize will ask the user if he allows the application to have access to his microphone. Then we start the timer and the voice recognition. This function takes in parameters the language to listen and a function which contains the text of the speech.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """Future<void> _initSpeechToText() async {
  bool available = await _speech.initialize(
      onStatus: _statusListener, onError: _errorListener);
      
if (available) {
    _startTimer();
    _speech.listen(
      onResult: _resultListener,
      localeId: _translateProvider.firstLanguage.code,
    );
  } else {
    print("The user has denied the use of speech recognition.");
  }
}

void _errorListener(SpeechRecognitionError error) {
  print("\${error.errorMsg} - \${error.permanent}");
}

void _statusListener(String status) {
  print("\$status");
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "Our function _resultListener will be called each time the user is saying something new, knowing that we restart the timer of 3 seconds to not stop the speech while the person was talking. When result.finalResult is true, the text in the result variable is the final version of the text.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "At the end of the 3 seconds ticks, we send back the corresponding text; we cancel the speech and the timer. When we call the startTimer we cancel the previous timer to recreate it.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """void _resultListener(SpeechRecognitionResult result) {
  if (!result.finalResult && _speech.lastStatus != "notListening") {
    _startTimer();
  }
  
setState(() {
    _speechText = result.recognizedWords;
  });
}

_startTimer() {
  if (_timer != null) {
    _timer.cancel();
  }
  
_timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
    if (t.tick == 3) {
      t.cancel();
      _speech.stop();
      Navigator.pop(context, _speechText);
    }
  });
}""",
          ),
          ACSpacer(),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part3/record_page.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "And here is the UI part, I will explain the component RecordButton I created at the end of this article in a bonus part. The screen displays a text “Talk now” until the user talks, when the user talks we display what he says in real-time. It displays the close button at the bottom left of the screen like the original application. It displays also the language the user must speak in at the bottom of the screen, and we have this information thanks to our provider.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """@override
Widget build(BuildContext context) {
  _translateProvider = Provider.of<TranslateProvider>(context, listen: true);
  
return Scaffold(
    backgroundColor: Colors.white,
    body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        margin: EdgeInsets.only(
          top: kToolbarHeight,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                _speechText != '' ? _speechText : 'Talk now',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              height: 180,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        Navigator.pop(context, _speechText);
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        RecordButton(
                          isActive: true,
                          onClick: (bool isActive) {
                            _stopListening();
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Text(
                            _translateProvider.firstLanguage.name,
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}""",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Conversation screen",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "We are going now to create the conversation screen. In this screen two persons are talking to each other with a real-time translation.",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part3/screenshot_conversation.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "This page is very similar to the previous page in many points. The main difference being the translation in this page and a system of conversation.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "We are keeping the text from the speech and the text translated to display both at the same time. We also translate the text “Talk now…” in the language concerned and we need to keep this information in the variable _talkNowTextLanguage1 and _talkNowTextLanguage2. Then we create a GoogleTranslate variable for the translation and index that will determine which person is talking.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class _ConversationPageState extends State<ConversationPage> {
  TranslateProvider _translateProvider;
  var _speech = SpeechToText();
  Timer _timer;
  String _talkNowTextLanguage1 = "";
  String _talkNowTextLanguage2 = "";
  String _textToTranslate = "";
  String _textTranslated = "";
  GoogleTranslator _translator = new GoogleTranslator();
  int _personTalkingIndex = 0;
  
@override
  void initState() {
    super.initState();
    _initSpeechToText();
  }
  
@override
  void deactivate() {
    _personTalkingIndex =-1;
    _timer.cancel();
    _speech.cancel();
    
super.deactivate();
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "The function retrieving voice recording information is changing. We translate the text at each call from this function with the right language thanks to the index we defined earlier.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """void _resultListener(SpeechRecognitionResult result) {
  if (!result.finalResult && _speech.lastStatus != "notListening") {
    _startTimer();
  }
  
// Translate the text
  String firstLanguageCode = "";
  String secondLanguageCode = "";
  
if (_personTalkingIndex == 0) {
    firstLanguageCode = _translateProvider.firstLanguage.code;
    secondLanguageCode = _translateProvider.secondLanguage.code;
  } else if (_personTalkingIndex == 1) {
    firstLanguageCode = _translateProvider.secondLanguage.code;
    secondLanguageCode = _translateProvider.firstLanguage.code;
  }
  
_translator
      .translate(result.recognizedWords,
          from: firstLanguageCode, to: secondLanguageCode)
      .then((translatedText) {
    setState(() {
      _textTranslated = translatedText;
    });
  });
  
setState(() {
    _textToTranslate = result.recognizedWords;
  });
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "The way to define our timer also changed. Each time we end a speech translation, we start a new one for the other language by changing the index. The last part of the function is a workaround to assure the speech recognition works well because I got some issues in my tests without it.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """_startTimer() async {
  if (_timer != null) {
    _timer.cancel();
  }

  _timer = Timer.periodic(Duration(seconds: 1), (Timer t) async {
    if (t.tick == 4 && t.isActive) {
      t.cancel();
      await _stopSpeech();

      if (_personTalkingIndex == 0) {
        setState(() {
          _personTalkingIndex = 1;
        });

        await _initSpeechToText();
      } else if (_personTalkingIndex == 1) {
        setState(() {
          _personTalkingIndex = 0;
        });

        await _initSpeechToText();
      }
    }

    if (t.isActive && _personTalkingIndex != -1 && !_speech.isListening) {
      await _initSpeechToText();
    }
  });
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "To displays \"Talk now…\" in the wanted language, we translate this text at start in both languages with this function and using again GoogleTranslator.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """_initTalkNowText() {
  _translator
      .translate("Talk now...",
          from: 'en', to: _translateProvider.firstLanguage.code)
      .then((translatedText) {
    setState(() {
      _talkNowTextLanguage1 = translatedText;
    });
  });
  
  _translator
      .translate("Talk now...",
          from: 'en', to: _translateProvider.secondLanguage.code)
      .then((translatedText) {
    setState(() {
      _talkNowTextLanguage2 = translatedText;
    });
  });
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "Now that we translated the text in both languages, we add two functions to display the right text for all the situations.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """String _displaysTextLanguage1() {
  if (_personTalkingIndex == 0) {
    if (_textToTranslate.isEmpty) {
      return _talkNowTextLanguage1;
    } else {
      return _textToTranslate;
    }
  } else if (_personTalkingIndex == 1) {
    if (_textTranslated.isEmpty) {
      return "";
    } else {
      return _textTranslated;
    }
  } else {
    return "";
  }
}

String _displaysTextLanguage2() {
  if (_personTalkingIndex == 0) {
    if (_textTranslated.isEmpty) {
      return "";
    } else {
      return _textTranslated;
    }
  } else if (_personTalkingIndex == 1) {
    if (_textToTranslate.isEmpty) {
      return _talkNowTextLanguage2;
    } else {
      return _textToTranslate;
    }
  } else {
    return "";
  }
}""",
          ),
          ACSpacer(),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part3/conversation_screen.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "And the UI part of this screen. It divides the screen in 3 parts, the text in the first language, the text in the second language and then the buttons at the bottom. As we wish the 2 languages part to take the biggest part of the screen, they are both the child of an Expanded widget. We conceived the RecordButton widget to accept buttons on the left and right which we are using on this screen. We stop the speech recognition and restart it and change the language when the user click on the left or right button.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """@override
Widget build(BuildContext context) {
  _translateProvider = Provider.of<TranslateProvider>(context, listen: true);

  if (_talkNowTextLanguage1.isEmpty || _talkNowTextLanguage2.isEmpty) {
    _initTalkNowText();
  }

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      brightness: Brightness.light,
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Text(
              _displaysTextLanguage1(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Text(
              _displaysTextLanguage2(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: SizedOverflowBox(
            size: Size.fromHeight(70),
            child: RecordButton(
              isActive: _personTalkingIndex != -1,
              leftWidget: Expanded(
                child: LanguageButton(
                  language: _translateProvider.firstLanguage.name,
                  direction: LanguageButtonDirection.left,
                  isSelected: _personTalkingIndex == 0,
                  onTap: () async {
                    await _stopSpeech();
                    setState(() {
                      _personTalkingIndex = 0;
                    });

                    await _initSpeechToText();
                  },
                ),
              ),
              rightWidget: Expanded(
                child: LanguageButton(
                  language: _translateProvider.secondLanguage.name,
                  direction: LanguageButtonDirection.right,
                  isSelected: _personTalkingIndex == 1,
                  onTap: () async {
                    await _stopSpeech();
                    setState(() {
                      _personTalkingIndex = 1;
                    });

                    await _initSpeechToText();
                  },
                ),
              ),
              onClick: (bool isPressed) async {
                if (isPressed) {
                  setState(() {
                    _personTalkingIndex = -1;
                  });

                  await _stopSpeech();
                } else {
                  setState(() {
                    _personTalkingIndex = 0;
                  });

                  await _initSpeechToText();
                }
              },
            ),
          ),
        ),
      ],
    ),
  );
}""",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Bonus: Record Button",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "The record button contains animations to keep the user aware of the speech recognition. The animations are composed of 2 containers in the shape of a circle with ScaleTransition delayed of 1 second between the both. We must add TickerProviderStateMixin to the State to use animations. In the initState, we declare the controller and the animation, each animation will last 2 seconds as we declare it in each AnimationController. We define the 1 second delay between the two animation in the initState as we declare it one second later. And don’t forget to dispose the controllers.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class RecordButton extends StatefulWidget {
  RecordButton({
    this.leftWidget,
    this.rightWidget,
    this.onClick,
    @required this.isActive,
  });

  final bool isActive;
  final Widget leftWidget;
  final Widget rightWidget;
  final Function(bool) onClick;

  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  Animation<double> _animation2;
  AnimationController _controller;
  AnimationController _controller2;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _controller2 =
            AnimationController(vsync: this, duration: Duration(seconds: 2))
              ..repeat();
        _animation2 =
            CurvedAnimation(parent: _controller2, curve: Curves.linear);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "Now the animation being declared we create a function which creates the button wave shape that grows over time for 2 seconds. Then, a function for each wave to display the declared waves.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """Widget _buttonWave(Animation<double> animation) {
  return Center(
    child: ScaleTransition(
      scale: animation,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 3,
            color: Colors.red,
            style: BorderStyle.solid,
          ),
        ),
        height: 140,
        width: 140,
      ),
    ),
  );
}

Widget _displaysButtonWave2() {
  if (widget.isActive && _animation2 != null) {
    return _buttonWave(_animation2);
  } else {
    return Container(
      height: 140,
      width: 140,
    );
  }
}

Widget _displaysButtonWave1() {
  if (widget.isActive && _animation != null) {
    return _buttonWave(_animation);
  } else {
    return Container(
      height: 140,
      width: 140,
    );
  }
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "We add the recording button in the Stack with the same initial size as the waves to center same on the same point. And also a Row to contain a left and right widget next to the recording button. In this configuration, the button waves will grow and display under the left and right widget as we wish here.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """Widget _displaysRecordingButton() {
  return Container(
    margin: EdgeInsets.only(top: 35),
    child: ButtonTheme(
      minWidth: 70.0,
      height: 70.0,
      child: RaisedButton(
        onPressed: () {
          widget.onClick(widget.isActive);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: widget.isActive ? null: 0,
        color: widget.isActive ? Colors.red : Color(0xFFededed),
        child: Icon(
          Icons.mic,
          color: Colors.white,
          size: 40,
        ),
      ),
    ),
  );
}

@override
Widget build(BuildContext context) {
  return Stack(
    children: [
      _displaysButtonWave1(),
      _displaysButtonWave2(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.leftWidget != null
              ? widget.leftWidget
              : Expanded(
                  child: Container(),
                ),
          _displaysRecordingButton(),
          widget.rightWidget != null
              ? widget.rightWidget
              : Expanded(
                  child: Container(),
                ),
        ],
      ),
    ],
  );
}""",
          ),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Second bonus: Button shape",
          ),
          ACImage(
            margin: const EdgeInsets.only(top: 32, bottom: 32),
            url: "assets/articles/google_translate_part3/button_shape.png",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "To get closer to the official design of Google Translate, I kept the same button shapes. I used the ClipPath Widget to change the shape of my buttons. I created a CustomClipper for each button defining the path to follow.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """class DiscussionLeftClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0.0);

    path.arcToPoint(
      Offset(size.width, size.height),
      clockwise: false,
      radius: Radius.elliptical(70, 60),
    );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class DiscussionRightClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    path.arcToPoint(
      Offset(0.0, 0.0),
      clockwise: false,
      radius: Radius.elliptical(70, 60),
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}""",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "We add the ClipPath widget as a parent of our container and define our CustomClipper on the argument called clipper.",
          ),
          ACCode(
            margin: EdgeInsets.only(top: 32),
            text: """@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: widget.onTap,
    child: ClipPath(
      clipper: _displaysDirection(),
      child: Container(
        height: 60,
        margin: _addMargins(),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.red : Color(0xFFededed),
          borderRadius: _displaysRoundedCorners(),
        ),
        child: Center(
          child: Text(
            widget.language,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : Colors.blue,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
  );
}

CustomClipper<Path> _displaysDirection() {
  if (widget.direction == LanguageButtonDirection.left) {
    return DiscussionLeftClip();
  } else if (widget.direction == LanguageButtonDirection.right) {
    return DiscussionRightClip();
  } else {
    return DiscussionLeftClip();
  }
}""",
          ),
          ACSpacer(),
          ACTitle1(
            margin: const EdgeInsets.only(top: 32),
            text: "Conclusion",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "I had no difficulty so far to recreate the Google Translate application which shows the mobile part of Flutter is already very practical. My next challenge is to use OCR technologies with Flutter to translate text from a photo and learn more about Flutter.",
          ),
          ACText(
            margin: const EdgeInsets.only(top: 8),
            text:
            "All the code is open source on Github:",
          ),
          ACLink(
            margin: const EdgeInsets.only(top: 8),
            text: "https://medium.com/r/?url=https%3A%2F%2Fgithub.com%2FAppli-chic%2Fgoogle-translate-flutter%2Ftree%2Fpart-3",
          ),
        ],
      ),
    );
  }
}
