package Text::WikiDoku ;
#require 5.008_000;  # not sure what I require
use strict;
use warnings;

use Carp
	qw/ croak / ;
use Digest::MD5
	qw/ md5_hex / ;
use Encode
	qw// ;
use HTML::Entities
	qw/ encode_entities / ;

our $VERSION   = '1.000000'; # 1.0.0
$VERSION = eval $VERSION ;
our @EXPORT_OK = qw// ;

=head1 NAME

Text::WikiDoku - Convert DokuWiki syntax to HTML

=head1 SYNOPSIS

	use Text::WikiDoku ;
	my $doku =
		Text:WikiDoku->new(
			"file.txt" ) ;
	my $doku_html = $doku->html() ;

	use Text::WikiDoku ;
	my $doku =
		Text::WikiDoku->new(
			"file.txt" ) ;
	my $doku_html_chunk =
		$doku->doc[0]->html() ;

=head1 DESCRIPTION

Produces DOM like structure to output HTML from.

This module implements the DokuWiki syntax from:

    http://www.dokuwiki.org/wiki:syntax

=head1 SYNTAX

TODO: Copy from the above source.

=head1 OPTIONS

None, right now.

=cut

sub new
{
}

__END__

=head1 BUGS

Well currently there's no code so we'd be doing well to have these.

=head1 VERSION HISTORY

See the Changes file for detailed release notes for this version.

=head1 AUTHOR

	Fergus Cameron
	http://cobbled.net/~fc0/

=head1 SOURCE CODE

You can find the source code repository for L<Text::WikiDoku>
on GitHub at <http://github.com/ttw/text-wiki-doku>.

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2014 Fergus Cameron
<http://cobbled.net/~fc0/>
All rights reserved.

=cut
