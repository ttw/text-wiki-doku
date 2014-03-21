#!/usr/bin/perl
# This is a convertion of 'hack-Nhe.pl' to use the
# actual lexer class from 'Text::WikiDoku::Lex'.

use strict ;
use warnings ;

use Text::WikiDoku::Lex ;
use Time::HiRes ;

my $lex0 = Text::WikiDoku::Lex->new() ;
$lex0->from( \*STDIN ) ;

TOKEN:
while( Time::HiRes::usleep(1) )
{
	my @tok0 = $lex0->yylex() ;
	last TOKEN if( not defined($tok0[1]) ) ;
#	next
#		if( $tok0[0] eq 'EOL'
#			or $tok0[0] eq 'BLANK' ) ;
	print($tok0[1],"\n") && next
		if( $tok0[0] eq 'SPLIT' ) ;
	print $tok0[0], ":", $tok0[1], "\n" ;
} ;
