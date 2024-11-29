# frozen_string_literal: true

require 'dotenv/load'
require 'langchain'
require 'openai'

require_relative 'event/schema'

module Rdvbot
  class Parser
    attr_reader :parser, :llm, :prompt

    def initialize
      setup_llm!
    end

    def call(user_prompt)
      full_prompt = prompt.format(
        description: user_prompt,
        format_instructions: parser.get_format_instructions
      )

      llm.chat(messages: [{ role: 'user', content: full_prompt }]).completion
    end

    private

    def setup_llm!
      @llm = Langchain::LLM::OpenAI.new(
        api_key: ENV.fetch('RDVBOT_OPENAI_KEY'),
        default_options: { chat_model: 'gpt-4o-mini' }
      )

      @prompt = Langchain::Prompt::PromptTemplate.new(
        template: "Format this event description in French into a structured format: {description}.\n{format_instructions}\n Only print the raw code, no backticks.",
        input_variables: %w[description format_instructions]
      )

      @parser = Langchain::OutputParsers::StructuredOutputParser.from_json_schema(Rdvbot::Event::SCHEMA)
    end
  end
end
