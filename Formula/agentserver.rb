# This file was generated during release. DO NOT EDIT.
class Agentserver < Formula
  desc "Connect local opencode to agentserver via WebSocket tunnel"
  homepage "https://github.com/agentserver/agentserver"
  url "https://github.com/agentserver/agentserver/archive/refs/tags/v0.18.3.tar.gz"
  sha256 "9faac19661f58240dddf07e8ad9cc7abf8cc5c2541255ee00690a2e2530cdca1"
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
