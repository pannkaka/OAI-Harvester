use Test::More tests => 5;

use strict;
use warnings;

use_ok( 'Net::OAI::Harvester' );


## XML Parsing Error

my $h = Net::OAI::Harvester->new( 'baseURL' => 'http://www.yahoo.com' );
isa_ok( $h, 'Net::OAI::Harvester' );

my $i = $h->identify();
isa_ok( $i, 'Net::OAI::Identify' );

is( $i->errorCode(), 'xmlParseError', 'caught XML parse error' );


## Missing parameter

$h = Net::OAI::Harvester->new( 
    baseURL => 'http://memory.loc.gov/cgi-bin/oai2_0' 
);
my $r = $h->listRecords( 'metadataPrefix' => 'argh' );
is( $r->errorCode(), 'cannotDisseminateFormat', 'parsed error code from server' );


