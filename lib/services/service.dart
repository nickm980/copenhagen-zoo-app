const months = [
  "Jan.",
  "Feb.",
  "March",
  "April",
  "May",
  "June",
  "July",
  "Aug.",
  "Sept.",
  "Oct.",
  "Nov.",
  "Dec.",
];

class EventListing {
  DateTime dateTime;
  String title;
  String description;
  String location;
  String thumbnail;
  int id;
  int price;
  bool isRegistered;
  String ages;
  int availableTickets;
  List<String> tags;
  String short;
  bool registrationRequired;

  EventListing(
      {
        this.registrationRequired=true,
        required this.short,
        this.availableTickets=10,
        required this.id, required this.dateTime,
      required this.title,
      required this.description,
      required this.thumbnail,
      required this.location,
      required this.price, this.isRegistered=false, required this.ages, required this.tags});

  bool isFree(){
    return this.price == 0;
  }

  String getFormattedDate() {
    return months[dateTime.month-1] + " " + dateTime.day.toString() + " • " + dateTime.hour.toString() + ":" + dateTime.minute.toString();
  }

  void register(){
    isRegistered = !isRegistered;
  }

}
var events = [
  EventListing(
      tags: ["Family"],

      ages: "All",
      price: 76,
      id: 1,
      dateTime: DateTime.now(),
      short: "Bring the family",
      description: "Bring your whole family to the zoo to see how well monkeys paint",
      thumbnail: "monkeypaint.jpg",
      title: "Paint With Monkeys",
      location: "Tropical Zoo"),
  EventListing(
      tags: ["Night Time"],
      ages: "16+",
      price: 76,
      id: 2,
      dateTime: DateTime.now(),
      short: "Perfect for date night or hang out",
      description: "Cujo (1984) will be shown at the Elephant House, a perfect date night or hang out with friends",
      thumbnail: "movie.jpg",
      title: "Horror Night",
      location: "Elephant House"),
  EventListing(
      tags: [],
      registrationRequired: false,
      ages: "All",
      price: 76,
      id: 3,
      dateTime: DateTime.now(),
      short: "Find Joey for a \$500 Gift Card",
      description: "Joey the elephant is MISSING! See if you can find him in the elephant house. The first guest to find him will win a \$500 GIFT CARD TO THE ZOO SHOP.",
      thumbnail: "elephant.jpg",
      title: "Trouble in the Jungle",
      location: "Copenhagen Zoo"),
];

class EventsService {
  List<EventListing> getEvents() {
    return events;
  }

  List<EventListing> getFilteredEvents(List<String> filters) {
    return events.where((event) {
      if (filters.isEmpty){
        return true;
      }

      for (String tag in filters){
        if (event.tags.contains(tag)){
          return true;
        }
      }

      return false;
    }).toList();
  }

  List<EventListing> getMyEvents() {

    return List.from(events.where((element) => element.isRegistered == true));
  }

  void register(int eventId){
      var index = events.indexWhere((element) => element.id == eventId);

      if (index == -1){
        print("not found");
        return;
      }

      events[index].register();

      for (EventListing event in events){if (event.isRegistered){
        print("Registered for: " + event.title);
      }
      }
  }
}
