---
title: "Grafana and Prometheus"
date: 2026-10-05
draft: false
tags: ["homelab", "monitoring", "grafana", "prometheus"]
---

I deployed the monitoring stack for the homelab. It's Grafana and Prometheus, with node exporter underneath.

Node exporter sits on the machine and exposes what the hardware and the operating system are up to: CPU, memory, disk, network. It doesn't store anything. It just answers when someone asks.

Prometheus is the one asking. It scrapes the exporter on a schedule and keeps the numbers as time series, so a value from an hour ago is still there when I want to hold it up against now.

Grafana sits on top and turns those series into graphs. It doesn't collect anything itself. It queries Prometheus and draws whatever comes back.

Each part only knows about the one next to it. The exporter has no idea Grafana exists, and Grafana couldn't tell you where a number came from beyond the query it sent. If I add another exporter later, Prometheus gets told where to look and the rest carries on.

What the graphs actually say can wait until they've had some time to collect numbers.
