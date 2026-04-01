import Config

config :ex_openai,
  # Optional settings
  base_url: System.get_env("OPENAI_API_URL"),
  http_options: [recv_timeout: 50_000],
  http_headers: [{"OpenAI-Beta", "assistants=v2"}]

if config_env() == :test do
  config :exvcr,
    filter_request_headers: [
      "OpenAI-Organization",
      "Openai-Organization",
      "openai-organization",
      "Authorization",
      "Set-Cookie"
    ]
end
