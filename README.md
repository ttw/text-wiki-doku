# text-wiki-doku

DokuWiki markup processor for IkiWiki.

There are probably better perl based parsers for the DokuWiki syntax
(specifically git://github.com/hoelzro/text-dokuwiki), however, there's both a
significant number of dependencies required for this parser (due to the
use of 'Moose') as well as being a hand-rolled parser (which I'm morally
opposed to ;-).  This parser is designed 'Parser::Lex' and 'Parser::Yapp'
and thus is based off a standard syntax; it has been developed
to be used with IkiWiki (git://github.com/joeyh/ikiwiki.git).

> It may be that 'Parser::RecDescent' is a better option, however, since
I'm not familiar with recursive descent parsers, I'm starting with with
these (as well as the possibility to use a C99 based, native parser for
improved performance).
