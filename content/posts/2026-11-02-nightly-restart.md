---
title: "Nightly restart"
date: 2026-11-02
draft: false
tags: ["homelab", "hugo"]
---

The pages are baked into the image. I push the markdown, the build makes a new image, and the container already running still has the old pages inside it. Nothing in that container reloads. The push sits in the new image until the container is replaced.

The new container pulls the latest tag when it starts, so it gets the image that was just built. Nothing is copied onto the one that's already up.

I don't replace it by hand. A job does that at 04:00, Amsterdam time. It restarts the site. If a restart is already running, another one does not start.

An ordinary restart would not stick. Flux puts the deployment back to what Git says, and that put-back starts the site a second time. The nightly job restarts it in a way Flux leaves alone.

A push after 04:00 is on the site the next morning, not the same evening.
