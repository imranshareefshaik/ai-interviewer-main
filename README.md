# AI Interviewer

AI Interviewer is a voice-based technical interview app. A user enters a GitHub profile, the backend scrapes public repository information, and the app runs a live interview session. The transcript, interview state, score, and feedback are stored in a local SQLite database.

## What This Project Does

1. A user submits a GitHub profile.
2. The backend scrapes the profile's public repositories.
3. The app creates an interview record.
4. The interview runs through browser audio and an AI conversation flow.
5. Messages are saved so you can review the interview later.
6. When the interview ends, the backend generates a score and feedback.

## Where Interview Data Is Stored

Interview data is stored in the backend SQLite database at:

`apps/backend/prisma/dev.db`

The database contains two important tables:

- `Interview` stores the interview metadata, GitHub snapshot, status, score, and feedback.
- `Message` stores the transcript messages for each interview.

### What Gets Saved

- `Interview.githubMetadata`: scraped GitHub repository data
- `Interview.status`: `Pre`, `InProgress`, or `Done`
- `Interview.score`: final interview score
- `Interview.feedback`: written feedback from the evaluation model
- `Message.message`: each transcript entry
- `Message.type`: `User` or `Assistant`
- `Message.createdAt`: when the message was saved

## How To Review Stored Interviews

You can inspect the database locally with Prisma Studio:

```bash
cd apps/backend
bunx prisma studio
```

That opens a browser view where you can inspect the `Interview` and `Message` tables.

You can also review the result page in the app itself after an interview is completed.

## Technologies Used

### Frontend

- **Bun** for running the app and scripts
- **React 19** for the UI
- **React Router** for page navigation
- **Tailwind CSS 4** for styling
- **Radix UI** for accessible UI primitives
- **Lucide React** for icons
- **Sonner** for toast notifications
- **WebRTC** and browser audio APIs for live microphone and playback handling

### Backend

- **Bun** runtime
- **Express** API server
- **Prisma** ORM
- **SQLite** local database
- **LibSQL adapter** for Prisma on Windows/local development
- **Axios** for GitHub API requests
- **WebSocket** for realtime AI session sideband communication
- **OpenAI Realtime API** for live interview conversations
- **Google Gemini** for the final scoring and feedback step
- **Deepgram** is optional and used for live transcription if a token is provided

### Monorepo Tooling

- **Turborepo** for workspace scripts
- **TypeScript** for type safety
- **Bun workspaces** for package management

## Run This Project From A Downloaded ZIP

### 1. Install prerequisites

- Install **Bun** for Windows: https://bun.sh
- Install **Git** if you want to push to GitHub
- Install **Node.js** only if you plan to use some external CLIs like Vercel or Railway

### 2. Open the project folder

After extracting the ZIP, open the root folder in VS Code:

`ai-interviewer-main`

### 3. Install dependencies

From the repository root run:

```bash
bun install
```

If Bun is not on your PATH, use the installed binary directly on Windows:

```powershell
& "$env:USERPROFILE\.bun\bin\bun.exe" install
```

### 4. Configure backend environment

Create or edit `apps/backend/.env` with:

```env
DATABASE_URL=file:./prisma/dev.db
OPENAI_KEY=your_openai_key
GEMINI_API_KEY=your_gemini_key
PROXY_URL=
```

Notes:

- `DATABASE_URL` points to the local SQLite database.
- `OPENAI_KEY` is needed for the realtime interview session.
- `GEMINI_API_KEY` is needed to generate the final evaluation.
- `PROXY_URL` is optional for GitHub scraping.

### 5. Initialize Prisma

From `apps/backend` run:

```bash
bunx prisma generate
bunx prisma db push
```

This creates the Prisma client and the local SQLite database file if it does not already exist.

### 6. Start the backend

```bash
cd apps/backend
bun run dev
```

The backend listens on `http://localhost:3001`.

### 7. Start the frontend

Open a second terminal:

```bash
cd apps/frontend
bun dev
```

The frontend usually runs on `http://localhost:3000`.

## How The App Flow Works

1. The homepage collects a GitHub URL.
2. The backend creates a new interview record in SQLite.
3. The frontend opens an interview session and asks for microphone access.
4. The app streams audio to the realtime interview engine.
5. Transcripts are saved as `Message` rows.
6. When the interview ends, the backend calculates feedback and score.
7. The result page reads the saved interview data and shows it for review.

## Deployment Notes

- The frontend can be deployed to Vercel.
- The backend still needs a live server plus a database and API keys.
- For production frontend builds, set `VITE_BACKEND_URL` to your deployed backend URL.

## Helpful Commands

```bash
bun install
bunx prisma studio
bunx prisma generate
bunx prisma db push
```

## Source Video

This project was originally built in a YouTube video by Harkirat Singh:

https://www.youtube.com/watch?v=iNJ7z4YLQFk