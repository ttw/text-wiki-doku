#!/usr/bin/perl

use strict ;
use warnings ;

use Parse::Token ;
use Parse::Lex ;
use Time::HiRes ;

my @tokens0 =
	(
		Parse::Token::Simple->new(
			Name => 'SPLIT',
			Regex => '^#\d+#$'),
		Parse::Token::Simple->new(
			Name => 'EOL',
			Regex => '\n' ),
		Parse::Token::Simple->new(
			Name => 'STRING',
			Regex => '\w+'),
		Parse::Token::Delimited->new(
			Name => 'BOLD',
			Start => '\*\*',
			End => '\*\*',
			Sub =>
				sub
				{
					$_[1] =~ s/^\*\*/<b>/ ;
					$_[1] =~ s/\*\*$/<\/b>/ ;
					$_[1] ;
				}
			),
		Parse::Token::Delimited->new(
			Name => 'ITALIC',
			Start => '//',
			End => '//',
			Sub =>
				sub
				{
					$_[1] =~ s!^//!<em>! ;
					$_[1] =~ s!//$!</em>! ;
					$_[1] ;
				}
			),
	) ;

my $lex0 = Parse::Lex->new( @tokens0 ) ;
$lex0->from( \*STDIN ) ;

TOKEN:
while( Time::HiRes::usleep(1) )
{
	my $tok0 = $lex0->next() ;
	last TOKEN if( $lex0->eoi() ) ;
	next if( not defined($tok0) ) ;
	print("EOL\n") && next
		if( $tok0->name() eq 'EOL' ) ;
	print($tok0->text(),"\n") && next
		if( $tok0->name() eq 'SPLIT' ) ;
	print $tok0->name(), ":", $tok0->text(), "\n" ;
} ;
