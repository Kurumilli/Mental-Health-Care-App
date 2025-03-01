import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SurveyController extends GetxController {
  static SurveyController get to => Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _progressNum = 1.obs;
  get progressNum => _progressNum.value;
  set progressNum(value) => _progressNum.value = value;

  final _nightProgressNum = 1.obs;
  get nightProgressNum => _nightProgressNum.value;
  set nightProgressNum(value) => _nightProgressNum.value = value;

  final _isCardSelected = <bool>[false, false, false, false].obs;

  bool getCardSelection(int index) => _isCardSelected[index];

  void setCardSelection(int index, bool value) {
    _isCardSelected[index] = value;
  }

  void turnOffAllSelections() {
    for (int i = 0; i < _isCardSelected.length; i++) {
      _isCardSelected[i] = false;
    }
  }

  void card0Selected() {
    turnOffAllSelections();
    setCardSelection(0, true);
  }

  void card1Selected() {
    turnOffAllSelections();
    setCardSelection(1, true);
  }

  void card2Selected() {
    turnOffAllSelections();
    setCardSelection(2, true);
  }

  void card3Selected() {
    turnOffAllSelections();
    setCardSelection(3, true);
  }

  void updateProgressNumber() {
    if (_isCardSelected.contains(true)) {
      if (progressNum == 9) {
        Get.offAllNamed('/priority-task');
      } else {
        progressNum++;
        turnOffAllSelections();
      }
    }
  }

  void updateNightProgressNumber() {
    if (_isCardSelected.contains(true)) {
      if (nightProgressNum == 6) {
        Get.offAllNamed('/main-screen', arguments: auth.currentUser);
      } else {
        nightProgressNum++;
        turnOffAllSelections();
      }
    }
  }

  @override
  void onClose() {

  }
}
