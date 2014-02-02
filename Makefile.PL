use strict;
use warnings;
use ExtUtils::MakeMaker;

my $mm_ver = $ExtUtils::MakeMaker::VERSION;
if ($mm_ver =~ /_/) { # dev version
    $mm_ver = eval $mm_ver;
    die $@ if $@;
}

WriteMakefile(
    NAME                => 'HTTP::DetectUserAgent',
    AUTHOR              => 'Takaaki Mizuno <cpan@takaaki.info>',
    VERSION_FROM        => 'lib/HTTP/DetectUserAgent.pm',
    ABSTRACT_FROM       => 'lib/HTTP/DetectUserAgent.pm',
    LICENSE             => 'perl',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More'      => 0,
        'Test::Base'      => 0,
        'version'         => 0,
        'Class::Accessor' => 0,
        'YAML'            => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'HTTP-DetectUserAgent-*' },
    META_MERGE   => {
        resources => {
            repository => 'https://github.com/neilbowers/HTTP-DetectUserAgent',
        },
    },

    ($mm_ver >= 6.48
        ? (MIN_PERL_VERSION => 5.006)
        : ()
    ),

);
