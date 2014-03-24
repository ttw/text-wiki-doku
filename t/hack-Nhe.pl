#!/usr/bin/perl
# This is a convertion of 'hack-gDX.pl' to use the
# actual parser class from 'Text::WikiDoku::Lex'.

use warnings ;
use strict ;

use Text::WikiDoku::Yapp ;

my $parse0 = Text::WikiDoku::Yapp->new() ;
$parse0->run( \*STDIN ) ;
