---
title: "Hermes on the cluster"
date: 2026-10-12
draft: false
tags: ["homelab", "k3s", "hermes"]
---

Hermes runs on the k3s cluster now, with the rest of the homelab.

I put the agent on the cluster instead of leaving it as a process I had to keep alive somewhere else. On the cluster it is a workload. The cluster places it on a node and keeps the process running. If the cluster is up, Hermes is up. I don't have a separate machine in my head for this one job.

Talking to it did not change. Messages still come in the same way. What changed is the address of the process. It sits with the other workloads, and the cluster treats it like one of them. No special path, no extra box, no ritual to start it before I can use it.

That is a smaller change than it sounds, and that is why I wanted it. The homelab already had a place that keeps things running. Hermes belongs there. This post is only that move. What it does once it is up, and the pieces that hang off it, are not the move.
