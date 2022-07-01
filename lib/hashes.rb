# frozen_string_literal: true

module Hashes

  ONE = {
    'grape' => 2,
    'nested' => {
      'j' => 2,
      'b' => 2,
      'nested2' => {
        'b' => 10,
        'd' => 45
                    }
                },
    'smile' => true,
    'hey' => 2,
    'nesty' => {
      'a' => 4,
      'b' => 2
                }
  }

  TWO = {
    'grape' => 1,
    'nested' => {
      'a' => 1,
      'b' => 2,
      'nested2' => {
        'b' => 10,
        'd' => 43
                    }
                },
    'smile' => true,
    'test' => 34,
    'nesty' => {
      'a' => 2,
      'b' => 3
               }
  }

  THREE = { 'a' => {'b' => 2, 'c' => 3}}

  FOUR = { 'a' => {'b' => 2, 'c' => 3}}
end
