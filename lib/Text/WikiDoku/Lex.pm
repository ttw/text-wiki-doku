package Text::WikiDoku::Lex ;

# require Parse::Lex ;
# push @ISA, 'Parse::Lex' ;
use parent 'Parse::Lex' ;

use Carp ;
use Parse::Token ;

my @_tokens0 =
	(
	# NOTE: this is a dummy token (for initial test hacks).
		Parse::Token::Simple->new(
			Name => 'SPLIT',
			Regex => '^#\d+#$'),
		Parse::Token::Simple->new(
			Name => 'B',
			Regex => '\*\*'),
		Parse::Token::Simple->new(
			Name => 'I',
			Regex => '//'),
		Parse::Token::Simple->new(
			Name => 'U',
			Regex => '__'),
		Parse::Token::Simple->new(
			Name => 'WORD',
			Regex => '[[:alnum:]]+'),
		Parse::Token::Simple->new(
			Name => 'PUNCT',
			Regex => '[[:punct:]]'),
					# This can only match one char to ensure our formatting is "longer".  i.e. this is an exception rule for non-formatting characters.
		Parse::Token::Simple->new(
			Name => 'GRAPH',
			Regex => '[[:graph:]]'),
					# As with PUNCT, this is an exception rule.
		Parse::Token::Simple->new(
			Name => 'QUOTE',
			Regex => '^[[:blank:]]*>+'),
	# NOTE: Theres is some oddity around the following few tokens (EMPTY_LINE, INDENT, SPACE) where order becomes important, even though the length should give preference.
		Parse::Token::Simple->new(
			Name => 'EMPTY_LINE',
			Regex => '^[[:blank:]]+$'),
		Parse::Token::Simple->new(
			Name => 'INDENT',
			Regex => '^[[:blank:]]'),
		Parse::Token::Simple->new(
			Name => 'SPACE',
			Regex => '[[:blank:]]'),
		Parse::Token::Simple->new(
			Name => 'EOL',
			Regex => '[\r\n]+'),
	) ;

sub new
{
	my $class = shift ;
	$class->skip('') ;
	my $self =
		$class->SUPER::new(
			@_tokens0 ) ;
	return $self ;
} ;

sub yylex
{
	my $self = shift ;
	my $tok0 = $self->next() ;
#	print STDERR "LEX_DEBUG?:",$tok0->name(),":",$tok0->text(),"\n" ;
	return ('',undef) if( $self->eoi() ) ;
	return ($tok0->name(),$tok0->text()) ;
} ;

1 ;
