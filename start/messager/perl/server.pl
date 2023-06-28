#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

# Create a listening socket
my $socket = new IO::Socket::INET (
    LocalHost => '0.0.0.0',
    LocalPort => '12345',
    Proto => 'tcp',
    Listen => 5,
    Reuse => 1
);
die "Cannot create socket $!\n" unless $socket;
print "Server is listening\n";

while(1)
{
    # Wait for a new client connection
    my $client_socket = $socket->accept();

    # Get information about a newly connected client
    my $client_address = $client_socket->peerhost();
    my $client_port = $client_socket->peerport();

    # Write a response to the client

    # Read up to 1024 characters from the connected client
    my $data = "";
    $client_socket->recv($data, 1024);
    $data = reverse $data;
    print "Received from Client : $data\n";

    print $client_socket (reverse($data));

    # Close the client connection
    shutdown($client_socket, 1);
}

# Close the socket
$socket->close();
