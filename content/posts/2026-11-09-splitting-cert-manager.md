---
title: "Splitting cert-manager"
date: 2026-11-09
draft: false
tags: ["homelab", "kubernetes", "flux", "cert-manager"]
---

cert-manager is the part of the cluster that looks after certificates. Installing it brings two kinds of thing. There are the controllers, the programs that run and do the work. And there are the new resource types it teaches Kubernetes, the custom resource definitions, or CRDs.

My config for cert-manager is written in those new types. Kubernetes only accepts it once the CRDs exist. Before that, it has no idea what I'm describing.

Flux applies what's in Git, and with controllers and configs in one bundle, it all went in together. Whether the configs landed after the CRDs came down to timing. I'd rather my cluster didn't run on luck.

So I split them. The controllers are one piece and the configs are another, and Flux is told the configs depend on the controllers. It applies the controllers, waits until they're ready, and only then moves on to the configs.

The order lives in Git now, next to everything else. Flux reads it the same way every time.
