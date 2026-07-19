class PastEvent {
  const PastEvent({
    required this.title,
    required this.dateLabel,
    required this.timeLabel,
    required this.location,
    required this.priceLabel,
    required this.description,
    required this.coverImage,
    this.galleryImages = const [],
    this.dateNeedsEditing = false,
  });

  final String title;
  final String dateLabel;
  final String timeLabel;
  final String location;
  final String priceLabel;
  final String description;
  final String coverImage;
  final List<String> galleryImages;

  /// True when the exact date is still a placeholder the organizers need
  /// to fill in (flagged rather than guessed).
  final bool dateNeedsEditing;
}

const List<PastEvent> pastEvents = [
  PastEvent(
    title: 'Reading Lounge',
    dateLabel: 'Sunday, 14 June',
    timeLabel: '16:00 until late',
    location: 'Pomelo Bar',
    priceLabel: 'Free Entry',
    description:
        'Bring a book of your own or don’t.\n\n'
        'Read, share, drift into your own world, or find yourself drawn into '
        'someone else’s conversation. However you choose to spend the evening, '
        'there’s a seat for you at ChoeungMa.',
    coverImage: 'assets/images/events/event1/cover.jpg',
    galleryImages: [
      'assets/images/events/event1/photo1.jpg',
      'assets/images/events/event1/photo2.jpg',
      'assets/images/events/event1/photo3.jpg',
    ],
  ),
  PastEvent(
    title: 'Look Out for the Mundane',
    dateLabel: 'Saturday, 11 July',
    timeLabel: '9:00 AM – 12:00 PM',
    location: 'Orussey & Street 240',
    priceLabel: 'Free Entry',
    description:
        'Spend the morning wandering through Orussey and Street 240, '
        'photographing whatever catches your attention or details that often '
        'disappear into the background. There isn’t a right way to do it.\n\n'
        'Whether you shoot on film, digital or your phone, everyone is welcome.\n\n'
        'Along the way, we’ll make a few stops for coffee, refreshments and '
        'conversation before ending the morning with a final gathering.\n\n'
        'Limited spaces — please message us for registration!',
    coverImage: 'assets/images/events/event2/cover.jpg',
  ),
  PastEvent(
    title: 'ChoeungMa Cinema Salon',
    dateLabel: 'Date to be added',
    timeLabel: '',
    location: 'Location to be added',
    priceLabel: '',
    dateNeedsEditing: true,
    description:
        'This isn’t a film that romanticizes the relationships or the events '
        'that took place. Rather, it invites us to reflect on a particular '
        'moment in Cambodia’s history, one shaped by war, trauma, and unequal '
        'power dynamics.\n\n'
        'It’s a reminder that these realities existed, and in many ways, '
        'continue to persist today. We hope the film gave us something to '
        'think about, and more importantly, encouraged conversations and '
        'collective action towards meaningful change.\n\n'
        'This Cinema Salon officially marks the start of ChoeungMa’s ongoing '
        'film programme — a space where conversations don’t always begin with '
        'a question. Sometimes, they begin with a film.\n\n'
        'Thank you to everyone who joined us, stayed for a drink, shared your '
        'thoughts, and spent the evening with us. These photographs are a '
        'small glimpse into the beginning of what we hope will become many '
        'evenings of cinema, cocktails, and conversation.',
    coverImage: 'assets/images/events/event3/photo1.jpg',
    galleryImages: [
      'assets/images/events/event3/photo2.jpg',
      'assets/images/events/event3/photo3.jpg',
      'assets/images/events/event3/photo4.jpg',
    ],
  ),
  PastEvent(
    title: 'The Colors We Carry',
    dateLabel: 'Sunday, 19 July',
    timeLabel: '15:00 until 21:00',
    location: 'Kuro Specialty Coffee, Street 228, Daun Penh',
    priceLabel: '',
    description:
        '“Fashion is a medium.” — Alexander McQueen\n\n'
        'What we wear is rarely just fabric. It carries memory, identity, '
        'rebellion, desire, belonging, and sometimes expectations that were '
        'never ours to begin with.\n\n'
        'This edition of ChoeungMa’s Reading Lounge explored the relationship '
        'between fashion, queer identity, and self-expression through books, '
        'magazines, photography, music, and conversation. Together, we asked '
        'what it means to make an authentic choice, and whether our '
        'identities are ever entirely our own.\n\n'
        'In collaboration with beU Station and Kuro Specialty Coffee.',
    coverImage: 'assets/images/events/event4/cover.jpg',
  ),
];
