import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class PrayerTimesService {
  Future<Map<String, dynamic>> getPrayerTimes() async {
    try {
      // Get current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      final double lat = position.latitude;
      final double lng = position.longitude;
      
      // Get prayer times from API
      final response = await http.get(
        Uri.parse(
          'http://api.aladhan.com/v1/timings/${DateTime.now().millisecondsSinceEpoch ~/ 1000}?latitude=$lat&longitude=$lng&method=2',
        ),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final timings = data['data']['timings'];
        
        // Filter main prayers
        final prayerTimes = {
          'Fajr': timings['Fajr'],
          'Sunrise': timings['Sunrise'],
          'Dhuhr': timings['Dhuhr'],
          'Asr': timings['Asr'],
          'Maghrib': timings['Maghrib'],
          'Isha': timings['Isha'],
        };
        
        // Determine current and next prayer
        final currentTime = DateTime.now();
        final currentPrayer = _getCurrentPrayer(prayerTimes, currentTime);
        final nextPrayer = _getNextPrayer(prayerTimes, currentTime);
        
        return {
          'times': prayerTimes,
          'currentPrayer': currentPrayer,
          'nextPrayer': nextPrayer,
          'location': 'Lat: ${lat.toStringAsFixed(2)}, Lng: ${lng.toStringAsFixed(2)}',
        };
      }
    } catch (e) {
      print('Error getting prayer times: $e');
    }
    
    // Fallback times
    return {
      'times': {
        'Fajr': '05:30',
        'Sunrise': '06:45',
        'Dhuhr': '12:30',
        'Asr': '15:45',
        'Maghrib': '18:20',
        'Isha': '19:45',
      },
      'currentPrayer': 'Dhuhr',
      'nextPrayer': 'Asr',
      'location': 'Default Location',
    };
  }
  
  String _getCurrentPrayer(Map<String, String> prayers, DateTime currentTime) {
    final currentTimeStr = '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}';
    
    final prayerEntries = prayers.entries.toList();
    for (int i = 0; i < prayerEntries.length - 1; i++) {
      if (currentTimeStr.compareTo(prayerEntries[i].value) >= 0 &&
          currentTimeStr.compareTo(prayerEntries[i + 1].value) < 0) {
        return prayerEntries[i].key;
      }
    }
    
    return 'Isha'; // Default to Isha if after last prayer
  }
  
  String _getNextPrayer(Map<String, String> prayers, DateTime currentTime) {
    final currentTimeStr = '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}';
    
    final prayerEntries = prayers.entries.toList();
    for (int i = 0; i < prayerEntries.length; i++) {
      if (currentTimeStr.compareTo(prayerEntries[i].value) < 0) {
        return prayerEntries[i].key;
      }
    }
    
    return 'Fajr'; // Next day Fajr
  }
}
