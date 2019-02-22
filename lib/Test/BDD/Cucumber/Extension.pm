package Test::BDD::Cucumber::Extension;

=head1 NAME

Test::BDD::Cucumber::Extension - Abstract superclass for extensions

=head1 DESCRIPTION

Provides an abstract superclass for extensions.  Loaded extensions will
have their hook-implementations triggered at specific points during
the BDD script execution.

=cut

use Moo;
use Types::Standard qw( HashRef );

=head1 PROPERTIES


=head2 config

A hash, the configuration read from the config file, verbatim.  Extensions
should look for their own configuration in
  $self->config->{extensions}->{<extension>}

=cut

has config => ( is => 'rw', isa => HashRef );

=head1 METHODS

=head2 steps_directories()

The returns an arrayref whose values enumerate directories (relative to
the directory of the extension) which hold step files to be loaded when
the extension is loaded.

=cut

sub step_directories { return []; }

=head2 pre_execute()

Invoked by C<App::pherkin> before executing any features.  This callback
allows generic extension setup. Reports errors by calling croak().

Note: When the C<TAP::Parser::SourceHandler::Feature> plugin for C<prove>
 is used, there are no guarantees at this point that this hook is called
 exactly once (or even just once per feature directory).

=head2 post_execute()

Invoked by C<App::pherkin> after executing all features.  This callback
allows generic extension teardown and cleanup. Reports errors by calling
croak().

Note: When the C<TAP::Parser::SourceHandler::Feature> plugin for C<prove>
 is used, there are no guarantees at this point that this hook is called
 at all (be it per feature directory or per C<prove> run).

=cut

sub pre_execute  { return; }
sub post_execute { return; }

=head2 pre_feature($feature, $feature_stash)

Invoked by the Executor before executing the background and feature scenarios
and their respective pre-hooks. Reports errors by calling croak().

=head2 post_feature($feature, $feature_stash)

Invoked by the Executor after executing the background and feature scenarios
and their respective post-hooks. Reports errors by calling croak().

=cut

sub pre_feature  { return; }
sub post_feature { return; }

=head2 pre_scenario($scenario, $feature_stash, $scenario_stash)

Invoked by the Executor before executing the steps in $scenario and
their respective pre-hooks. Reports errors by calling croak().

=head2 post_scenario($scenario, $feature_stash, $scenario_stash, $failed)

Invoked by the Executor after executing all the steps in $scenario
and their respective post-hooks. Reports errors by calling croak().

$failure indicates whether any of the steps in the scenario has failed.

=cut

sub pre_scenario  { return; }
sub post_scenario { return; }

=head2 pre_step($step, $step_context)

Invoked by the Executor before executing each step in $scenario.
Reports errors by calling croak().

Feature and scenario stashes can be reached through
 $step_context->{stash}->{feature} and
 $step_context->{stash}->{scenario}

Note: *executed* steps, so not called for skipped steps.

=head2 post_step($step, $step_context, $result)

Invoked by the Executor after each executed step in $scenario.
Reports errors by calling croak().

$result is a C<Test::BDD::Cucumber::Model::Result> instance which
holds the completion status of the step.

Note: *executed* steps, so not called for skipped steps.

=cut

sub pre_step  { return; }
sub post_step { return; }

=head1 AUTHOR

Erik Huelsmann C<ehuels@gmail.com>

=head1 LICENSE

Copyright 2016, Erik Huelsmann; Licensed under the same terms as Perl

=cut

1;
