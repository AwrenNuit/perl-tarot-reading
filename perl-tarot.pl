#!/usr/bin/perl

use strict;
use warnings;

local $|         = 1;
my $EOL          = "\n";
my $EMPTY_STRING = q{};
my $drawCards    = $EMPTY_STRING;
my $areYouSure   = $EMPTY_STRING;
my $randomNumber = 0;
my @selectedNums = ();
my @firstCard    = ();
my @secondCard   = ();
my @thirdCard    = ();
my @cardPosition = (
  'The first card symbolizes the recent past - where you are coming from.',
  'The middle card symbolizes the present - where you are right now.',
  'The final card symbolizes the future - where you are going.',
);

my @majorArcana = (
  {
    name => '0 - The Fool',
    description => 'beginnings, naivety, and reckless optimism',
  },
  {
    name => '1 - The Magician',
    description => 'manifestation, resourcefulness, and untapped potential',
  },
  {
    name => '2 - The High Priestess',
    description => 'intuition, secrets, and the subconscious',
  },
  {
    name => '3 - The Empress',
    description => 'beauty, abundance, and possibly dependence on others',
  },
  {
    name => '4 - The Emperor',
    description => 'authority, structure, and inflexibility',
  },
  {
    name => '5 - The Hierophant',
    description => 'conformity, tradition, and spiritual beliefs',
  },
  {
    name => '6 - The Lovers',
    description => 'love, relationships, and possibly a misalignment of values',
  },
  {
    name => '7 - The Chariot',
    description => 'determination, willpower, and possibly a lack of direction',
  },
  {
    name => '8 - Strength',
    description => 'courage, compassion, and possibly self-doubt',
  },
  {
    name => '9 - The Hermit',
    description => 'introspection, inner guidance, and possibly isolation',
  },
  {
    name => '10 - Wheel of Fortune',
    description => 'good and bad luck, destiny, and breaking cycles',
  },
  {
    name => '11 - Justice',
    description => 'fairness, truth, and possibly dishonesty',
  },
  {
    name => '12 - The Hanged Man',
    description => 'surrender, letting go, and possibly delays',
  },
  {
    name => '13 - Death',
    description => 'endings, transitions, and inner purging',
  },
  {
    name => '14 - Temperance',
    description => 'moderation, patience, and possibly excess',
  },
  {
    name => '15 - The Devil',
    description => 'addiction, restriction, and releasing limiting beliefs',
  },
  {
    name => '16 - The Tower',
    description => 'sudden change, chaos, and personal change',
  },
  {
    name => '17 - The Star',
    description => 'hope, faith, and possibly despair',
  },
  {
    name => '18 - The Moon',
    description => 'illusion, intuition, and possibly inner confusion',
  },
  {
    name => '19 - The Sun',
    description => 'positivity, success, and inner child',
  },
  {
    name => '20 - Judgement',
    description => 'inner calling, absolution, and possibly ignoring the call',
  },
  {
    name => '21 - The World',
    description => 'completion, integration, and personal closure',
  },
);

Main();

sub cardMeaning {
  print $_[0] . $EOL x2;
  sleep(3);
  print "You drew: $_[1]{name}" . $EOL x2;
  sleep(3);
  print "This card signifies $_[1]{description}." . $EOL x2;
  sleep(5);
  print '-----------------------------------------' . $EOL x2;
}

sub conclusion {
  print 'And so concludes your reading. Take some time to reflect on this.' . $EOL x2;
  sleep(5);
}

sub drawCards {
  generateRandomNumber();
  push(@firstCard, $majorArcana[$randomNumber]);
  generateRandomNumber();
  push(@secondCard, $majorArcana[$randomNumber]);
  generateRandomNumber();
  push(@thirdCard, $majorArcana[$randomNumber]);
  sleep(2);
  print $EOL . 'The cards have been drawn. Take a deep breath and ground yourself.' . $EOL x2;
  sleep(7);
}

sub drawCardsPrompt {
  print 'Would you like to have your future told? Y/N' . $EOL;
  $drawCards = uc(<STDIN>);
  chomp($drawCards);
  if ( $drawCards eq 'Y' ) {
    sleep(1);
    print $EOL . 'Are you absolutely sure? This can be quite revealing. Y/N' . $EOL;
    $areYouSure = uc(<STDIN>);
    chomp($areYouSure);
    if ( $areYouSure eq 'Y' ) {
      return 1;
    }
  }
}

sub generateRandomNumber {
  $randomNumber = int(rand(22));
  while ( $randomNumber ~~ @selectedNums ) {
    $randomNumber = int(rand(22));
  }
  push(@selectedNums, $randomNumber);
}

sub Main {
  printLogo();
  if ( drawCardsPrompt() ) {
    drawCards();
    cardMeaning($cardPosition[0], @firstCard);
    cardMeaning($cardPosition[1], @secondCard);
    cardMeaning($cardPosition[2], @thirdCard);
    conclusion();
  } else {
    print $EOL . 'Safe travels.' . $EOL x2;
  }
}

sub printLogo {
  print $EOL . $EOL x3;
  print '         *                                                *' . $EOL;
  select(undef, undef, undef, 0.25);
  print '         **                                              **' . $EOL;
  select(undef, undef, undef, 0.25);
  print '         ***                                            ***' . $EOL;
  select(undef, undef, undef, 0.25);
  print '     ************                                  ************' . $EOL;
  select(undef, undef, undef, 0.25);
  print '    **************                                **************' . $EOL;
  select(undef, undef, undef, 0.25);
  print '         ***       *****   ***   ****      *****       ***' . $EOL;
  select(undef, undef, undef, 0.25);
  print '         ***      ** ****   ***** ****    ** ****      ***' . $EOL;
  select(undef, undef, undef, 0.25);
  print '         ***     **   ****   ***   ****  **   ****     ***' . $EOL;
  select(undef, undef, undef, 0.25);
  print '         ***    ***    ***   ***        ***    ***     ***' . $EOL;
  select(undef, undef, undef, 0.25);
  print '         ***    ***    ***   ***        ***    ***     ***' . $EOL;
  select(undef, undef, undef, 0.25);
  print '          **    ****   ***   ***        ****   ***     **' . $EOL;
  select(undef, undef, undef, 0.25);
  print '          **     ****  ***    **         **** ***      **' . $EOL;
  select(undef, undef, undef, 0.25);
  print '           *      *****  **    *          ******       *' . $EOL;
  select(undef, undef, undef, 0.25);
  print $EOL;
  sleep(2);
}