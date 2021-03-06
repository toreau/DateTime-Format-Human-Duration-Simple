# NAME

DateTime::Format::Human::Duration::Simple - Get a locale specific string
describing the span of a given datetime duration.

# VERSION

Version 0.01

# SYNOPSIS

    use DateTime::Format::Human::Duration::Simple;
    use DateTime;

    my $from = DateTime->now;
    my $to   = $from->clone->add(
        years   => 1,
        months  => 2,
        days    => 3,
        hours   => 4,
        minutes => 5,
        seconds => 6,
    );

    my $duration = DateTime::Format::Human::Duration::Simple->new(
        from           => $from, # required
        to             => $to,   # required
        # locale       => 'en',  # optional, default is 'en' (English)
        # serial_comma => 1,     # optional, default is 1 (true)
    );

    say $duration->formatted_duration;
    # 1 year, 2 months, 3 days, 4 hours, 5 minutes, and 6 seconds

# DESCRIPTION

This is a simple class for getting a localized string representing the duration
between two [DateTime](https://metacpan.org/pod/DateTime) objects.

This class is inspired by [DateTime::Format::Human::Duration](https://metacpan.org/pod/DateTime::Format::Human::Duration), and shares its
namespace. I feel, however, that [DateTime::Format::Human::Duration](https://metacpan.org/pod/DateTime::Format::Human::Duration) is a bit
"heavy", and it's not updated very often. I also don't like its interface, so I
created this class for an alternative that better suited me. If it will suit
others, I don't know (or care), but there's always nice with alternatives. :)

# METHODS

## new( %args )

Constructs a new DateTime::Format::Human::Duration::Simple object;

    my $duration = DateTime::Format::Human::Duration::Simple->new(
        from           => DateTime->new( ... ), # required
        to             => DateTime->new( ... ), # required
        locale         => 'de',                 # optional (default = 'en')
        # serial_comma => 1,                    # optional, default is 1 (true)
    );

## duration

Returns the current [DateTime::Duration](https://metacpan.org/pod/DateTime::Duration) object, which is used by this class
behind the scenes to generate the localized output.

## formatted\_duration

Returns the locale specific string describing the span of the duration in
question.

# What is the "serial comma"?

The "serial comma", also called the "oxford comma", is an optional comma before
the word "and" (and/or other separating words) at the end of the list. Consider
not using a serial comma:

    1 hour, 2 minutes and 3 seconds

...vs. using a serial comma:

    1 hour, 2 minutes, and 3 seconds

This value is defined per locale, i.e. from what's most normal (...) in each
locale, but you can override when generating an instance of this class;

    my $human = DateTime::Format::Human::Duration::Simple->new(
        from         => $from_datetime,
        to           => $to_datetime,
        serial_comma => 0, # turn it off for all locales
    );

You can read more about the serial comma [on Wikipedia](https://en.wikipedia.org/wiki/Serial_comma).

# AUTHOR

Tore Aursand, `<toreau at gmail.com>`

# BUGS

Please report any bugs or feature requests to the web interface at [https://rt.cpan.org/Dist/Display.html?Name=DateTime-Format-Human-Duration-Simple](https://rt.cpan.org/Dist/Display.html?Name=DateTime-Format-Human-Duration-Simple)

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc DateTime-Format-Human-Duration-Simple

You can also look for information at:

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/DateTime-Format-Human-Duration-Simple](http://annocpan.org/dist/DateTime-Format-Human-Duration-Simple)

- CPAN Ratings

    [http://cpanratings.perl.org/d/DateTime-Format-Human-Duration-Simple](http://cpanratings.perl.org/d/DateTime-Format-Human-Duration-Simple)

- Search CPAN

    [http://search.cpan.org/dist/DateTime-Format-Human-Duration-Simple/](http://search.cpan.org/dist/DateTime-Format-Human-Duration-Simple/)

# SEE ALSO

- [DateTime](https://metacpan.org/pod/DateTime)
- [DateTime::Duration](https://metacpan.org/pod/DateTime::Duration)
- [DateTime::Format::Human::Duration](https://metacpan.org/pod/DateTime::Format::Human::Duration)

# LICENSE AND COPYRIGHT

The MIT License (MIT)

Copyright (c) 2015 Tore Aursand

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
