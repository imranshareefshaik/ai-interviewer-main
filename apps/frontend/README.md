# Frontend

This package contains the browser UI for AI Interviewer.

## What It Does

- Shows the landing page and GitHub URL form.
- Starts the interview screen.
- Requests microphone permission in the browser.
- Displays the live status and audio meters.
- Shows the final interview results page.

## Install

```bash
bun install
```

## Run in Development

```bash
bun dev
```

The frontend usually runs on `http://localhost:3000`.

## Production Build

```bash
bun run build
```

## Optional Environment Variables

You can set these in a local `.env` file if needed:

```env
VITE_BACKEND_URL=http://localhost:3001
VITE_DEEPGRAM_TOKEN=
```

- `VITE_BACKEND_URL` points the frontend to the backend service.
- `VITE_DEEPGRAM_TOKEN` enables live transcription, but it is optional.

## Review Pages

- `/` starts a new interview.
- `/interview/:interviewId` shows the live interview screen.
- `/result/:interviewId` shows the saved transcript and feedback.

## Quick local run helpers

- Start both backend and frontend and open the app in your browser:

```powershell
./scripts/run-local.ps1
```

- Expose your local backend to the internet (requires Node.js / npx and localtunnel):

```powershell
./scripts/expose-backend.ps1
```

