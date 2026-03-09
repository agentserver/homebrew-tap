# This file was generated during release. DO NOT EDIT.
class Agentserver < Formula
  desc "Connect local opencode to agentserver via WebSocket tunnel"
  homepage "https://github.com/agentserver/agentserver"
  url "https://github.com/agentserver/agentserver/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "46cab89f9741561206c7af9adf07785d6988e39cda6dad5cd61181796dc73e58"
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
