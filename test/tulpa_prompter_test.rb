# frozen_string_literal: true

require "test_helper"

class TulpaPrompterTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TulpaPrompter::VERSION
  end

  def test_should_generate_prompts
    options = {
      lines: ["prompt #1", "prompt #2", "prompt #3"],
      prefix: "portrait painting ",
      suffix: " by greg rutkowski",
      interval: 20
    }

    output = TulpaPrompter.call(options)

    assert_equal "animation_prompts = {\n  0: \"portrait painting prompt #1 by greg rutkowski\",\n  20: \"portrait painting prompt #2 by greg rutkowski\",\n  40: \"portrait painting prompt #3 by greg rutkowski\",\n}", output
  end
end
