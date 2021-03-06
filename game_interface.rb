# frozen_string_literal: true

# GameInterface loads all text used for the game's terminal interface
module GameInterface
  private

  def display_separator
    puts <<-HEREDOC
    ------------------------------------------------------------------
    ------------------------------------------------------------------
    HEREDOC
  end

  def display_hint
    puts <<-HEREDOC


    Secret Word: #{secret_hint.join('   ')}

    HEREDOC
  end

  def display_incorrect_guesses
    puts <<-HEREDOC

    Incorrect Guesses (#{guesses_left} remaining): #{wrong_guesses.join(' ')}

    HEREDOC
  end

  def display_hangman
    case guesses_left
    when 8
      man =
        "│
    │
    │
    │
    │
    │               "
    when 7
      man =
        "│            │
    │
    │
    │
    │
    │               "
    when 6
      man =
        "│            │
    │            │
    │
    │
    │
    │               "
    when 5
      man =
        "│            │
    │            │
    │            O
    │
    │
    │               "
    when 4
      man =
        "│            │
    │            │
    │            O
    │            |
    │            |
    │               "
    when 3
      man =
        "│            │
    │            │
    │            O
    │           /|
    │            |
    │               "
    when 2
      man =
        "│            │
    │            │
    │            O
    │           /|\\
    │            |
    │               "
    when 1
      man =
        "│            │
    │            │
    │            O
    │           /|\\
    │            |
    │           /   "
    when 0
      man =
        "│            │
    │            │
    │            O
    │           /|\\
    │            |
    │           / \\"
    end

    puts <<-HEREDOC
    │────────────│
    #{man}
    │
    │──────│
    │      │───────
    │              │
     ──────────────
    HEREDOC
  end

  def display_game
    display_separator
    display_hint
    display_hangman
    display_incorrect_guesses
  end
end
