FROM elixir:1.18-alpine AS builder

ENV ERL_AFLAGS="+JMsingle true"

RUN apk add --no-cache build-base git

WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.exs mix.lock ./
COPY config config

RUN mix deps.clean --all
RUN mix clean
RUN mix deps.get --only prod

COPY lib lib

ENV MIX_ENV=prod

RUN mix compile
RUN mix release --overwrite

FROM alpine:3.18

RUN apk add --no-cache openssl ncurses-libs libgcc libstdc++ ffmpeg


WORKDIR /app

COPY --from=builder /app/_build/prod/rel/portfolio ./

COPY rust.md .
COPY priv ./priv

ENV MIX_ENV=prod
CMD ["bin/portfolio", "start"]
