# This file was generated during release. DO NOT EDIT.
class Agentserver < Formula
  desc "Connect local opencode to agentserver via WebSocket tunnel"
  homepage "https://github.com/agentserver/agentserver"
  url "https://github.com/agentserver/agentserver/archive/refs/tags/v0.18.2.tar.gz"
  sha256 "c09b3c1e8e5619ab4ae344bf8ca534fa3d5d1a93661deae20f48b1cb4d8dc219"
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
