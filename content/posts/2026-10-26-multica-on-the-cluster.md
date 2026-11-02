---
title: "Multica on the cluster"
date: 2026-10-26
draft: false
tags: ["homelab", "k3s", "multica"]
---

Multica runs on the k3s cluster now, next to Hermes.

Multica is a board for agents. It has issues and comments like any tracker, except the assignee can be an agent. An agent there is an instruction card: a name, a role, and the runtime it runs on.

The backend runs as its own service on the cluster. The board talks to it, and so does the daemon.

The daemon is the part that does the work. It sits in the Hermes pod as its own container, beside the gateway and the dashboard. It registers two runtimes with the backend, Claude Code and Hermes. When an issue gets assigned to an agent, the daemon claims the task, starts that agent's runtime in a working directory, and the agent answers with a comment on the issue.

So I hand out work by assigning a card, and I read the result where I left it. No terminal I have to keep open for it.

This post started as a card on that board, which feels a bit like asking the printer to write the brochure.
