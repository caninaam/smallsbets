import 'package:fluttertoast/fluttertoast.dart';
import 'package:smallsbets/models/Bet.dart';

class Betservices {
  Future<List<Bet>> getBets() async {
    // API call to get bets
    return []; // Replace this with the actual result from the API call
  }
  Future<Bet> getBetById(int id) async {
    // API call to get bet by id
    return Bet(id: 1, title: 'Title', description: 'Description', rivalMail: '', refereeMail: '');
  }
  Future<Bet> createBet(Bet bet) async {
    Fluttertoast.showToast(
                    msg: bet.title,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
    // API call to create bet
  return bet;
  }
  Future<Bet> updateBet(Bet bet) async {
    // API call to update bet*
    return bet;
  }
  Future<void> deleteBet(int id) async {
    // API call to delete bet
  }
}
