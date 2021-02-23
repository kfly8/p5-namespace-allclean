requires 'perl', '5.008001';

requires 'namespace::clean', '0.20';
requires 'B::Hooks::EndOfScope', '0.12';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

