use lib 't/lib';
use Test::More;
use Elasticsearch::Client::Test;

test_files('spec/test/cluster.node_info/*.yaml');

done_testing;