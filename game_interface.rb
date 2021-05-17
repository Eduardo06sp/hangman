#frozen_string_literal: true

module GameInterface
  def display_hint
    puts <<-HEREDOC
    Secret Word: #{secret_hint.join('   ')}
    HEREDOC
  end

  def display_hangman
    case guesses_left
    when 6
      man =
        "│
    │
    │
    │               "
    when 5
      man =
        "│            O
    │
    │
    │               "
    when 4
      man =
        "│            O
    │            |
    │            |
    │               "
    when 3
      man =
        "│            O
    │           /|
    │            |
    │               "
    when 2
      man =
        "│            O
    │           /|\\
    │            |
    │               "
    when 1
      man =
        "│            O
    │           /|\\
    │            |
    │           /   "
    when 0
      man =
        "│            O
    │           /|\\
    │            |
    │           / \\"
    end

    puts <<-HEREDOC
    │────────────│
    │            │
    │            │
    #{man}
    │
    │──────│
    │      │───────
    │              │
     ──────────────
    HEREDOC
  end
end
