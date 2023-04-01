import 'package:tr1/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(String dlt) async {
    await launchUrl(Uri.parse(
        'google.navigation:q=$dlt&key=${Constants.googleAPIkey}'));

    //String direction_URL = "https://www.google.com/maps/dir/?api=1&origin=Google+Pyrmont+NSW&destination=QVB&destination_place_id=ChIJISz8NjyuEmsRFTQ9Iw7Ear8&travelmode=walking";
    // String googleUrl =
    //     'https://www.google.com/maps/dir/@$latitude,$longitude/@9.004497, 38.768277,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x164b8413fc1635bb:0x457e2540409dc6f8!2m2!1d38.7528529!2d8.9764312';

    //'https://www.google.com/maps/dir/8.9806108,38.7577572/Gofa+Gebriel+Church,+Addis+Ababa,+Ethiopia/@$latitude,$longitude,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x164b8413fc1635bb:0x457e2540409dc6f8!2m2!1d38.7528529!2d8.9764312
    //https://www.google.com/maps/search/?api=1&query=$latitude,$longitude
    //
    // if (await canLaunch(googleUrl)) {
    //   await launch(googleUrl);
    // } else {
    //   throw 'Could not open the map.';
    // }
  }
}
