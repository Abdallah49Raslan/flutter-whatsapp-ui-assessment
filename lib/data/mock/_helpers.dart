DateTime nowMinus({
  int days = 0,
  int hours = 0,
  int minutes = 0,
  int seconds = 0,
}) => DateTime.now()
    .subtract(Duration(days: days, hours: hours, minutes: minutes, seconds: seconds));

const String loremShort =
    'Hey! This is a fairly long preview text to make sure the row wraps correctly on small screens.';

const String loremLong =
    'This is a very long message intended to test text wrapping and overflow handling in the chat bubble. '
    'It includes punctuation, new lines, and emojis to simulate real-world usage.\n\n'
    'Line two with some extra details and a couple of emojis 😊🔥✨.';