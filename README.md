# Link to the application - https://vlang-benchmarks-visualization-xq84s.ondigitalocean.app/

![image](https://user-images.githubusercontent.com/36485221/147782664-8b8923ac-602e-43d2-9850-37e98d65cceb.png)

## What?

This repo is a home for my first Vlang project - visualisation of V benchmarks results, which you can find here - *[Is V still fast](https://fast.vlang.io/)*

## Why?

A list of problems, that this project should resolve:
 - provide a quick statistic about AVG/median value for every benchmark
 - provide a fancy, interactable and adjustable plots, that will describe how specific benchmark's results have been changing over the time

It's always more easier to work with a lot of data records than just with a plain text.

## How?

This is fully created in V, using a native V web framework - [vweb](https://github.com/vlang/v/tree/master/vlib/vweb)
Initially it was planned as WASM app, but because of there is no native WASM support and a "hot-DOM" changes from native language (like [Blazor](https://dotnet.microsoft.com/en-us/apps/aspnet/web-apps/blazor)) are unsupported, for now this is a common server-side web app (this info is true for today, 30.12.2021).

This app was deployed on App Platform from [DigitalOcean](https://www.digitalocean.com/) via [Docker](https://www.docker.com/), you can find a Dockerfile in the root of this repo (image based on [Clear Linux](https://clearlinux.org/)).
