use warnings;
use strict;
use Plack::Test;
use Plack::Builder;
use HTTP::Request::Common;
use Capture::Tiny qw/capture_stderr/;
use Test::More;

# STORE & FETCH
{
    my $app = builder {
        enable 'EnvTracer', callback => sub {
            my ($summary, $trace) = @_;
            warn "$summary\n$trace\n";
        };
        sub {
            $ENV{TEST_TRACE_ENV} = 7;

            return [
                200,
                ['Content-Type' => 'text/html'],
                ["<html><body><p>ENV:$ENV{TEST_TRACE_ENV}</p></body></html>"]
            ];
        };
    };

    my $stderr = capture_stderr {
        test_psgi $app, sub {
            my $cb  = shift;
            my $res = $cb->(GET '/');

            is $res->code, 200;
            like $res->content, qr{<p>ENV:7</p>};
        };
    };

    note $stderr;
    like $stderr, qr!FETCH:1!;
    like $stderr, qr!STORE:1!;
    like $stderr, qr!EXISTS:0!;
    like $stderr, qr!STORE\tTEST_TRACE_ENV=7!;
    like $stderr, qr!FETCH\tTEST_TRACE_ENV!;
}

done_testing;
