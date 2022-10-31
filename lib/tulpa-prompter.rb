require_relative "tulpa_prompter/version"

module TulpaPrompter
  class Error < StandardError; end

  def self.call(options)
    options[:format] ||= {}
    options[:format][:frame] ||= 'integer'

    options[:interval] ||= 15
    options[:interval] = options[:interval].to_i
    options[:lines].shuffle! if options[:shuffle].to_s.downcase == "true" || options[:shuffle].to_s == "1"

    prompts = options[:lines].map.with_index do |line, index|
      frame = index * options[:interval]
      frame = "\"#{frame}\"" if options[:format][:frame] == 'string'

      prompt = line.strip
      prompt = options[:prefix].to_s + prompt + options[:suffix].to_s
      prompt = prompt.gsub("\"", "\\\"")

      "  #{frame}: \"#{prompt}\""
    end

    output = ""
    output << "#{options[:format][:assign]} = " if options[:format][:assign]
    output << "{\n"
    output << prompts.join(",\n")
    output << "\n}"

    output
  end
end
