#frozen_string_literal: true

module GameInterface
  def display_hint
    puts <<-HEREDOC
    Secret Word: #{secret_hint.join('   ')}
    HEREDOC
  end
end
