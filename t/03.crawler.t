use strict;
use warnings;
use Test::Base;
use HTTP::DetectUserAgent;

plan tests =>  (3 * blocks);

filters {
    input    => [qw(chomp)],
    expected => [qw(yaml)],
};

run {
    my $block = shift;
    my $ua = HTTP::DetectUserAgent->new($block->input);
    my $expected = $block->expected;
    is $ua->type, "Crawler";
    is $ua->name, $expected->{name};
    is $ua->vendor, $expected->{vendor};
}

__END__

=== googlebot
--- input
Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)
--- expected
name: "Googlebot"
vendor: "Google"

=== googlebot mobile
--- input
DoCoMo/1.0/N505i/c20/TB/W20H10 (compatible; Googlebot-Mobile/2.1; +http://www.google.com/bot.html)
--- expected
name: "Googlebot Mobile"
vendor: "Google"

=== Yahoo! Slurp
--- input
Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)
--- expected
name: "Yahoo! Slurp"
vendor: "Yahoo"

=== Baiduspider
--- input
Baiduspider+(+http://help.baidu.jp/system/05.html)
--- expected
name: "Baiduspider"
vendor: "Baidu"

=== msnbot
--- input
msnbot/1.1 (+http://search.msn.com/msnbot.htm)
--- expected
name: "msnbot"
vendor: "Microsoft"

=== Twiceler
--- input
Mozilla/5.0 (Twiceler-0.9 http://www.cuill.com/twiceler/robot.html)
--- expected
name: "Twiceler"
vendor: "Cuil"
