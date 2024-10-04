import 'package:domi/model/location.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final BehaviorSubject<Location?> locationController =
      BehaviorSubject<Location?>();
  final BehaviorSubject<double?> costController =
      BehaviorSubject<double?>();
  Location? selectedLocation;
  final List<Location> _locations = [
    Location(street: '4A Building', state: 'District 1'),
    Location(street: '4A Building', state: 'District 3'),
    Location(street: '4A Building', state: 'District 3'),
    Location(street: '4A Building', state: 'District 3'),
    Location(street: '4A Building', state: 'District 3'),
    Location(street: '4A Building', state: 'District 3'),
    Location(street: '4A Building', state: 'District 3'),
    Location(street: '6C Plaza', state: 'District 7'),
  ];

  Iterable<Location> getLocation(String text) {
    return _locations.where((Location location) {
      return location.street.toLowerCase().contains(text.toLowerCase());
    });
  }

  void onCostChange(double? value) {
    costController.sink.add(value);
  }

  void onSelectLocation(Location? location) {
    locationController.sink.add(location);
  }

  void dispose() {
    locationController.close();
  }
}
