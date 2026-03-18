<p align="center">
  <img src="https://img.shields.io/badge/Prompt_Person™-AI_Agent_Starter_Kit-8A5CF6?style=for-the-badge&labelColor=0A0A0A" alt="Prompt Person AI Agent Starter Kit" />
</p>

<h1 align="center">AI Agent Starter Kit</h1>

<p align="center">
  <strong>Build your own AI assistant in 5 minutes. No coding required.</strong>
</p>

<p align="center">
  <a href="https://promptperson.com/starter-kit">Website</a> •
  <a href="https://www.tiktok.com/@prompt.person">TikTok</a> •
  <a href="https://www.youtube.com/@PromptPerson">YouTube</a> •
  <a href="https://www.instagram.com/thepromptperson/">Instagram</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/license-MIT-green?style=flat-square" alt="MIT License" />
  <img src="https://img.shields.io/badge/platform-Mac%20%7C%20Windows%20%7C%20Linux-blue?style=flat-square" alt="Platform" />
  <img src="https://img.shields.io/badge/powered%20by-Claude%20by%20Anthropic-8A5CF6?style=flat-square" alt="Powered by Claude" />
</p>

---

## What Is This?

A downloadable starter kit that sets up a **personal AI agent** on your computer. Not a chatbot — an agent that remembers you, manages your work, and gets smarter every day.

**Yes, ChatGPT and Claude have memory now.** And Anthropic even launched **Cowork**, which lets you automate tasks right from the Claude desktop app — no terminal needed. That's great for getting started, but this kit is the customizable alternative: your own workflows, personas, memory architecture, and full portability across Claude Code or OpenClaw. An AI agent that you fully own and control.

### What You Get (Free Trial)

- **One-command setup** — Run a script, answer 1 question, done
- **Talk to your agent** — See what an AI agent feels like in the terminal
- **100% private** — Runs locally on your machine
- **Limited responses** — Upgrade for full-length output, memory, workflows, and more

## Quick Start

```bash
# 1. Clone this repo
git clone https://github.com/austinbailey198-hash/ai-agent-starter-kit.git

# 2. Run the setup
cd ai-agent-starter-kit
chmod +x setup.sh
./setup.sh

# 3. Start your agent
cd ~/my-ai-agent && claude
```

Or just **double-click `START HERE.command`** on Mac.

## Requirements

| Requirement | Details |
|---|---|
| **Computer** | Mac, Windows, or Linux |
| **Node.js** | Auto-installed by setup script if missing |
| **Claude Account** | Claude Pro ($20/mo) or Anthropic API credits (~$5-20/mo) |

> **Note:** This kit requires Claude by Anthropic. ChatGPT integration is not available yet — updates coming soon.

## How It Works

```
You run setup.sh
    ↓
It asks: your name, role, and goals
    ↓
It creates a workspace at ~/my-ai-agent
    ↓
Your agent knows who you are and what you need
    ↓
Type "claude" and start talking
```

Your agent can:
- Draft emails, messages, and documents
- Research any topic and summarize findings
- Plan your day, week, and projects
- Create and manage task lists
- Remember your clients, projects, and preferences
- Get smarter every conversation

## Example Conversations

```
You: Draft an email to my team about rescheduling tomorrow's meeting to Thursday

Agent: Here's a draft:

Subject: Meeting Rescheduled — Thursday

Hi team,

Quick heads up — tomorrow's meeting has been moved to Thursday at the same time.
Same agenda, just shifting the day. Let me know if that doesn't work for anyone.

Thanks,
[Your name]
```

```
You: Remember that my biggest client is Acme Corp and my main contact is Sarah Johnson

Agent: Got it — saved to memory. I'll remember Acme Corp is your biggest client
and Sarah Johnson is your main contact there.
```

```
You: Help me plan my week

Agent: Let me help you organize. What do you have coming up?
Any deadlines, meetings, or priorities I should know about?
```

## Want More?

This free version is a taste. The full kits include:

### Starter Kit — $49
Everything to get your agent running with 4 workflows, 50+ prompt library, Sleep Guard, and a step-by-step guide.

### Pro Kit — $99 (normally $149)
The full system: 5 agent personas, 9 pro workflows, MCP integration guide (Gmail, Calendar, Slack), The AI Agent Playbook, OpenClaw setup guide, monthly workflow drops, and a 30-min 1-on-1 setup call.

**→ [Get the full kit at promptperson.com/starter-kit](https://promptperson.com/starter-kit)**

## Project Structure

```
ai-agent-starter-kit/
├── READ ME FIRST.txt      ← Plain English setup guide
├── START HERE.command      ← Double-click to begin (Mac)
├── setup.sh                ← Setup script (auto-installs dependencies)
├── templates/
│   └── daily-tasks.md      ← Daily planning template
└── workflows/
    ├── email-drafter.md    ← Email drafting workflow
    ├── research.md         ← Research workflow
    └── weekly-review.md    ← Weekly review workflow
```

## FAQ

**Do I need to know how to code?**
No. If you can double-click a file, you can use this.

**How much does it cost to run?**
The kit is free. Running the AI costs $5-20/month through Anthropic (the company behind Claude).

**Is my data private?**
Yes. Everything runs on your computer. The only external call is to Anthropic's API for AI responses.

**Can I use this with ChatGPT?**
Not yet. This kit is built for Claude by Anthropic. ChatGPT support is planned for a future update.

**Can I customize my agent?**
Yes. Your agent's personality lives in one file (CLAUDE.md). Edit it however you want.

## Contributing

Found a bug? Have a workflow idea? Open an issue or submit a PR.

## License

MIT License — use it however you want.

---

<p align="center">
  <strong>Built by <a href="https://promptperson.com">Austin Bailey</a></strong>
  <br />
  <sub>Prompt Person™ — Learn AI. Use it better.</sub>
</p>
