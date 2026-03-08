# This file was generated during release. DO NOT EDIT.
class Agentserver < Formula
  desc "Connect local opencode to agentserver via WebSocket tunnel"
  homepage "https://github.com/agentserver/agentserver"
  url "https://github.com/agentserver/agentserver/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "3f91278c0f29da2587375ef9c204d8c9d71f79108dfa4f9e62b8f53b08dd6537"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/agentserver/agentserver/internal/agent.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/agentserver-agent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentserver --version")
  end
end
