#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

# Create a connecting socket
my $socket = new IO::Socket::INET (
    PeerHost => 'server',
    PeerPort => '12345',
    Proto => 'tcp',
);
die "Cannot connect to the server $!\n" unless $socket;

# Write a request to the server
my $request = "$ARGV[0]";
my $size = $socket->send($request);

# Read the server's response
my $response = "";
$socket->recv($response, 1024);
print "$response";

# Close the connection
$socket->close();
