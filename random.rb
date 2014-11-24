# -*- encoding: utf-8 -*-

require 'carrier-pigeon'

rand = [`openssl rand 128 | base64`,
        `openssl rand 128 | base64 | tr '!-~' 'P-~!-O'`,
        `head -c64 /dev/urandom | base64`,
        `head -c64 /dev/urandom | base64 | tr '!-~' 'P-~!-O'`,
        `strings /dev/urandom | tr -d "\n" | head -c 64`,
        `strings /dev/urandom | tr -d "\n" | head -c 64 | tr '!-~' 'P-~!-O'`,
       ].sample

pigeon = CarrierPigeon.new(:host => "irc",
                           :port => 16660,
                           :nick => "random",
                           :channel => "#random",
                           :join => true)

pigeon.message("#random", rand)
pigeon.die
