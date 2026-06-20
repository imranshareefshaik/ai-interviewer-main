# Backend

This package is the API and database layer for AI Interviewer.

## What It Does

- Accepts the GitHub URL submitted from the frontend.
- Scrapes public GitHub repository data.
- Creates interview records in SQLite.
- Streams realtime interview setup data to the AI service.
- Saves user and assistant transcript messages.
- Generates final score and feedback after the interview is finished.

## Storage

The backend stores data in a local SQLite database:

`prisma/dev.db`

Prisma models:

- `Interview`
- `Message`

## Environment Variables

Create `apps/backend/.env` with:

```env
DATABASE_URL=file:./prisma/dev.db
OPENAI_KEY=your_openai_key
GEMINI_API_KEY=your_gemini_key
PROXY_URL=
```

## Install

```bash
bun install
```

## Initialize Database

```bash
bunx prisma generate
bunx prisma db push
```

## Run

```bash
bun run dev
```

The backend listens on `http://localhost:3001`.

## Review Data

Open Prisma Studio to inspect saved interviews and messages:

```bash
bunx prisma studio
```

## Notes

- `OPENAI_KEY` is required for the realtime session.
- `GEMINI_API_KEY` is required for the final scoring step.
- `PROXY_URL` is optional and only needed if you want GitHub scraping through a proxy.
