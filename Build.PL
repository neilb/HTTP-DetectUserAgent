use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'HTTP::DetectUserAgent',
    license             => 'perl',
    dist_author         => 'Takaaki Mizuno <cpan@takaaki.info>',
    dist_version_from   => 'lib/HTTP/DetectUserAgent.pm',
    requires => {
        'Test::More'      => 0,
        'Test::Base'      => 0,
        'version'         => 0,
        'Class::Accessor' => 0,
    },
    add_to_cleanup      => [ 'HTTP-DetectUserAgent-*' ],
);

$builder->create_build_script();
