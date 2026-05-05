cask "agentx" do
  version "0.128.0"

  on_macos do
    on_arm do
      sha256 "a582a69c45683c8f7c4eaaa292103c6155d02f015b6f0edf604f76a986aee7c2"
      url "https://github.com/agentserver/codex/releases/download/agentx-v#{version}/agentx-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "2c6ba6b337bd89bd31c29deeb4a379a0413194088ca7bec8877c8e6c002499a7"
      url "https://github.com/agentserver/codex/releases/download/agentx-v#{version}/agentx-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    on_arm do
      sha256 "50af77fa2f5a3b826becc7dbc4e201ad6e63f97f0651871a580502be97ad5dcc"
      url "https://github.com/agentserver/codex/releases/download/agentx-v#{version}/agentx-aarch64-unknown-linux-musl.tar.gz"
    end
    on_intel do
      sha256 "a0fcb9b1d7e3652c144c21519238b3149bc996a8fb017d9fbb941d13f2edf24b"
      url "https://github.com/agentserver/codex/releases/download/agentx-v#{version}/agentx-x86_64-unknown-linux-musl.tar.gz"
    end
  end

  name "agentx"
  desc "Lightweight coding agent that runs in your terminal (agentserver fork of OpenAI Codex)"
  homepage "https://github.com/agentserver/codex"

  depends_on formula: "ripgrep"

  binary "agentx"

  zap trash: "~/.codex"
end
