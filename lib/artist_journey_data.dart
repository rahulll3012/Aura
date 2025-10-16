// Data model for a single event in an artist's journey
class JourneyEventData {
  final String year;
  final String event;
  final String type;

  JourneyEventData({required this.year, required this.event, required this.type});
}

// A map containing the timeline data for various artists
final Map<String, List<JourneyEventData>> artistJourneys = {
  "The Weeknd": [
    JourneyEventData(year: '2011', event: 'Released mixtapes "House of Balloons", "Thursday", and "Echoes of Silence".', type: 'album'),
    JourneyEventData(year: '2013', event: 'Debut studio album "Kiss Land" is released.', type: 'album'),
    JourneyEventData(year: '2015', event: '"Beauty Behind the Madness" earns him two Grammy Awards.', type: 'award'),
    JourneyEventData(year: '2016', event: 'Releases the chart-topping album "Starboy".', type: 'album'),
    JourneyEventData(year: '2020', event: '"After Hours" is released, featuring the hit "Blinding Lights".', type: 'album'),
    JourneyEventData(year: '2021', event: 'Headlined the Super Bowl LV halftime show.', type: 'milestone'),
  ],
  "Harry Styles": [
    JourneyEventData(year: '2010', event: 'Auditioned for The X Factor and formed One Direction.', type: 'start'),
    JourneyEventData(year: '2016', event: 'One Direction begins its hiatus.', type: 'milestone'),
    JourneyEventData(year: '2017', event: 'Releases his debut self-titled solo album.', type: 'album'),
    JourneyEventData(year: '2019', event: 'Sophomore album "Fine Line" is released to critical acclaim.', type: 'album'),
    JourneyEventData(year: '2021', event: 'Wins his first Grammy for "Watermelon Sugar".', type: 'award'),
    JourneyEventData(year: '2022', event: 'Releases "Harry\'s House" and stars in "Don\'t Worry Darling".', type: 'album'),
  ],
  "Dua Lipa": [
    JourneyEventData(year: '2015', event: 'Signed with Warner Music Group and released her first single.', type: 'start'),
    JourneyEventData(year: '2017', event: 'Releases her self-titled debut album with the hit "New Rules".', type: 'album'),
    JourneyEventData(year: '2019', event: 'Wins Grammy for Best New Artist.', type: 'award'),
    JourneyEventData(year: '2020', event: 'Releases her second album "Future Nostalgia".', type: 'album'),
    JourneyEventData(year: '2021', event: '"Future Nostalgia" wins the Grammy for Best Pop Vocal Album.', type: 'award'),
    JourneyEventData(year: '2023', event: 'Appears in the "Barbie" movie and releases "Dance the Night".', type: 'milestone'),
  ],
  "Olivia Rodrigo": [
    JourneyEventData(year: '2020', event: 'Signs with Geffen and Interscope Records.', type: 'start'),
    JourneyEventData(year: '2021', event: 'Releases debut single "Drivers License" to international success.', type: 'milestone'),
    JourneyEventData(year: '2021', event: 'Debut album "SOUR" is released, breaking streaming records.', type: 'album'),
    JourneyEventData(year: '2022', event: 'Wins three Grammy Awards, including Best New Artist.', type: 'award'),
    JourneyEventData(year: '2023', event: 'Releases her second album, "Guts".', type: 'album'),
  ],
};
