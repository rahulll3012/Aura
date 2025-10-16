class Artist {
  final String name;
  final String imageUrl;
  final String bio;
  final int followers;

  Artist({
    required this.name,
    required this.imageUrl,
    required this.bio,
    required this.followers,
  });
}

// You can also add mock artist data here if you'd like
final List<Artist> mockArtists = [
  Artist(
    name: "The Weeknd",
    imageUrl: "https://i.scdn.co/image/ab6761610000e5eb214f3cf1cbe7139c1e26ff02",
    bio: "Abel Makkonen Tesfaye, known professionally as the Weeknd, is a Canadian singer, songwriter, and record producer.",
    followers: 55000000,
  ),
  Artist(
    name: "Harry Styles",
    imageUrl: "https://i.scdn.co/image/ab6761610000e5eb64046d8d471b3a3956dba983",
    bio: "Harry Edward Styles is an English singer, songwriter, and actor. His musical career began in 2010 as a solo contestant on The X Factor.",
    followers: 48000000,
  ),
  Artist(
    name: "Dua Lipa",
    imageUrl: "https://i.scdn.co/image/ab6761610000e5eb7da39dea0b2746c1811c0c7c",
    bio: "Dua Lipa is an English and Albanian singer and songwriter. Possessing a mezzo-soprano vocal range, she is known for her signature disco-pop sound.",
    followers: 67000000,
  ),
];