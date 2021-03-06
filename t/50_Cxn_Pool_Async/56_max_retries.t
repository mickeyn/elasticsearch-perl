use Test::More;
use Test::Exception;
use Search::Elasticsearch::Async;
use lib 't/lib';
use MockAsyncCxn qw(mock_noping_client);

## Max retries

my $t = mock_noping_client(
    { nodes => [ 'one', 'two', 'three' ], max_retries => 1 },

    { node => 1, code => 200, content => 1 },
    { node => 2, code => 200, content => 1 },
    { node => 3, code => 200, content => 1 },
    { node => 1, code => 509, error   => 'Unavailable' },
    { node => 2, code => 509, error   => 'Unavailable' },

    # throws unavailable
    { node => 3, code => 200, content => 1 },
    { node => 3, code => 200, content => 1 },

);

ok $t->perform_sync_request()
    && $t->perform_sync_request
    && $t->perform_sync_request
    && !eval { $t->perform_sync_request }
    && $@ =~ /Unavailable/
    && $t->perform_sync_request
    && $t->perform_sync_request,
    'Max retries';

done_testing;

