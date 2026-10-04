---
title: "k3s with Flux"
date: 2026-10-04
draft: false
tags: ["homelab", "k3s", "kubernetes", "gitops", "flux"]
---

I wanted a Kubernetes cluster at home, and I didn't want one I'd set up by hand and then forget how. So I built it with k3s, via GitOps, using Flux.

k3s is Kubernetes cut down to a size that suits a homelab. It's a light install and it still behaves like the real thing, which is about all I ask of it.

GitOps means the cluster's desired state lives in a Git repository. I commit what should run and push it. Flux runs inside the cluster, watches that repository, and applies what it finds. If the cluster wanders off from what's in Git, Flux pulls it back.

That changes how the cluster feels. Every change I make is a commit, with a date and a message, sitting in the history. When I want to know why something is running, I can look up when it arrived and what I was thinking at the time. Well, what I wrote down that I was thinking.

As far as Flux cares, the repository is the cluster. Anything I want to keep goes through Git first.
