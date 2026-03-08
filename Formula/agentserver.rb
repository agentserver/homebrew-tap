# This file was generated during release. DO NOT EDIT.
class Agentserver < Formula
  desc "Connect local opencode to agentserver via WebSocket tunnel"
  homepage "https://github.com/agentserver/agentserver"
  url "https://github.com/agentserver/agentserver/archive/refs/tags/v0.18.1.tar.gz"
  sha256 "1a82acfe0705f60a35b4c4c9b3c037b3bedfc6ed1fc3f0307d6de824e9000094"
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
