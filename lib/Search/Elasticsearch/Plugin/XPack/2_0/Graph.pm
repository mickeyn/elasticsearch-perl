package Search::Elasticsearch::Plugin::XPack::2_0::Graph;

use Moo;
with 'Search::Elasticsearch::Plugin::XPack::API::2_0';
with 'Search::Elasticsearch::Role::Client::Direct';
use namespace::clean;

__PACKAGE__->_install_api('graph');

1;

# ABSTRACT: Plugin providing Graph API for Search::Elasticsearch 2.x

=head1 SYNOPSIS

    use Search::Elasticsearch();

    my $es = Search::Elasticsearch->new(
        nodes    => \@nodes,
        plugins  => ['XPack']
    );

    my $response = $es->graph->explore(...);

=head2 DESCRIPTION

This class extends the L<Search::Elasticsearch> client with a C<graph>
namespace, to support the API for the
L<Graph|https://www.elastic.co/products/graph> plugin for Elasticsearch.
In other words, it can be used as follows:

    use Search::Elasticsearch();
    my $es = Search::Elasticsearch->new(
        nodes    => \@nodes,
        plugins  => ['XPack']
    );

    my $response = $es->graph->explore(...);

=head1 METHODS

The full documentation for the Graph plugin is available here:
L<https://www.elastic.co/guide/en/graph/current/index.html>

=head2 C<explore()>

    $response = $es->graph->explore(
        index => $index | \@indices,        # optional
        type  => $type  | \@types,          # optional
        body  => {...}
    )

The C<explore()> method allows you to discover vertices and connections which relate
to your query.

See the L<explore docs|https://www.elastic.co/guide/en/graph/current/graph-api-rest.html>
for more information.
