package DateTime::Format::Human::Duration::Simple::Locale;
use Moose;
use namespace::autoclean;

has 'serial_comma' => (
    isa     => 'Bool',
    is      => 'ro',
    default => 1,
);

has 'units' => (
    isa     => 'HashRef[ArrayRef[Str]]',
    is      => 'ro',
    lazy    => 1,
    builder => '_build_units',
);

sub _build_units {
    my $self = shift;

    return {
        and         => [ 'and' ],

        year        => [ 'year',        'years'        ],
        month       => [ 'month',       'months'       ],
        week        => [ 'week',        'weeks'        ],
        hour        => [ 'hour',        'hours'        ],
        day         => [ 'day',         'days'         ],
        hour        => [ 'hour',        'hours'        ],
        minute      => [ 'minute',      'minutes'      ],
        second      => [ 'second',      'seconds'      ],
        millisecond => [ 'millisecond', 'milliseconds' ],
        nanosecond  => [ 'nanosecond',  'nanoseconds'  ],
    };
}

sub get_unit_for_value {
    my $self  = shift;
    my $unit  = shift;
    my $value = shift;

    unless ( defined $value ) {
        return $self->units->{$unit}->[0];
    }

    return ( $value == 1 ) ? $self->units->{$unit}->[0] : $self->units->{$unit}->[1];
}

__PACKAGE__->meta->make_immutable;

1;
