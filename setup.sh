#!/bin/bash

# ============================================================
#  AI Agent Starter Kit — by Prompt Person™
#  Get your own AI assistant running in under 5 minutes.
# ============================================================

set -e

PURPLE='\033[0;35m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
DIM='\033[2m'
BOLD='\033[1m'
NC='\033[0m'

clear
echo ""
echo ""
echo -e "${PURPLE}${BOLD}  ╔══════════════════════════════════════════╗${NC}"
echo -e "${PURPLE}${BOLD}  ║                                          ║${NC}"
echo -e "${PURPLE}${BOLD}  ║   PROMPT PERSON™ AI AGENT STARTER KIT    ║${NC}"
echo -e "${PURPLE}${BOLD}  ║                                          ║${NC}"
echo -e "${PURPLE}${BOLD}  ║   Your personal AI assistant — in 5 min  ║${NC}"
echo -e "${PURPLE}${BOLD}  ║                                          ║${NC}"
echo -e "${PURPLE}${BOLD}  ╚══════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${DIM}Welcome! This script will set everything up for you.${NC}"
echo -e "  ${DIM}Just follow the prompts. No coding knowledge needed.${NC}"
echo ""
echo -e "  ${YELLOW}Press Enter to start...${NC}"
read

# -----------------------------------------------------------
# Step 1: Check & install prerequisites
# -----------------------------------------------------------
clear
echo ""
echo -e "${PURPLE}${BOLD}  STEP 1 of 4: Checking your computer${NC}"
echo -e "  ${DIM}Making sure you have everything needed...${NC}"
echo ""

# Check Node.js
if command -v node &> /dev/null; then
  echo -e "  ${GREEN}✓${NC} Node.js found"
else
  echo -e "  ${YELLOW}⚠${NC} Node.js not found — installing it now..."
  echo ""

  # Detect OS and install
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &> /dev/null; then
      brew install node
    else
      echo -e "  ${DIM}Installing Homebrew first (Mac package manager)...${NC}"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew install node
    fi
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
  else
    echo ""
    echo -e "  ${RED}Could not auto-install Node.js on your system.${NC}"
    echo -e "  ${BOLD}Please install it manually:${NC}"
    echo ""
    echo -e "  1. Go to ${PURPLE}https://nodejs.org${NC}"
    echo -e "  2. Click the big green download button"
    echo -e "  3. Install it (just click Next through the prompts)"
    echo -e "  4. Close this terminal, open a new one, and run this script again"
    echo ""
    exit 1
  fi

  if command -v node &> /dev/null; then
    echo -e "  ${GREEN}✓${NC} Node.js installed successfully"
  else
    echo -e "  ${RED}✗${NC} Node.js installation failed. Please install manually from https://nodejs.org"
    exit 1
  fi
fi

sleep 0.5

# Check Claude Code
if command -v claude &> /dev/null; then
  echo -e "  ${GREEN}✓${NC} Claude Code found"
else
  echo -e "  ${YELLOW}⚠${NC} Claude Code not found — installing it now..."
  npm install -g @anthropic-ai/claude-code 2>/dev/null

  if command -v claude &> /dev/null; then
    echo -e "  ${GREEN}✓${NC} Claude Code installed successfully"
  else
    echo ""
    echo -e "  ${RED}Could not install Claude Code automatically.${NC}"
    echo -e "  ${BOLD}Try running this command yourself:${NC}"
    echo ""
    echo -e "  ${PURPLE}npm install -g @anthropic-ai/claude-code${NC}"
    echo ""
    echo -e "  Then run this setup script again."
    exit 1
  fi
fi

sleep 0.5
echo ""
echo -e "  ${GREEN}${BOLD}Everything looks good!${NC}"
echo ""
echo -e "  ${YELLOW}Press Enter to continue...${NC}"
read

# -----------------------------------------------------------
# Step 2: Personalize
# -----------------------------------------------------------
clear
echo ""
echo -e "${PURPLE}${BOLD}  STEP 2 of 4: Let's personalize your agent${NC}"
echo -e "  ${DIM}Answer 3 quick questions so your agent knows who you are.${NC}"
echo ""
echo ""

read -p "  What's your first name? → " USER_NAME
echo ""
echo -e "  ${GREEN}Hey ${USER_NAME}!${NC}"
echo ""

read -p "  What do you do? (e.g., freelancer, student, founder, marketer) → " USER_ROLE
echo ""

read -p "  What should your agent help with? (e.g., emails, research, planning) → " USER_GOALS
echo ""
echo ""
echo -e "  ${GREEN}${BOLD}Got it!${NC} Setting up an agent for ${USER_NAME} the ${USER_ROLE}."
echo ""

# -----------------------------------------------------------
# Step 2.5: API Key
# -----------------------------------------------------------
echo -e "  ${DIM}─────────────────────────────────────────────${NC}"
echo ""
echo -e "  ${BOLD}One more thing: your AI needs an engine.${NC}"
echo ""
echo -e "  Your agent uses Anthropic's Claude AI to think."
echo -e "  You need ONE of these:"
echo ""
echo -e "    ${PURPLE}Option A:${NC} Claude Pro subscription (\$20/mo)"
echo -e "             ${DIM}Sign up at claude.ai — simplest option${NC}"
echo ""
echo -e "    ${PURPLE}Option B:${NC} Anthropic API key (pay-as-you-go)"
echo -e "             ${DIM}Get one at console.anthropic.com${NC}"
echo ""
echo -e "  ${DIM}Already have Claude Pro? You're good — just press Enter.${NC}"
echo ""

read -p "  Paste your API key (or press Enter to skip): " API_KEY
echo ""

if [ -n "$API_KEY" ]; then
  echo -e "  ${GREEN}✓${NC} API key saved"

  # Save to shell profile
  SHELL_RC="$HOME/.zshrc"
  if [ -f "$HOME/.bashrc" ] && [ ! -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.bashrc"
  fi

  if ! grep -q "ANTHROPIC_API_KEY" "$SHELL_RC" 2>/dev/null; then
    echo "" >> "$SHELL_RC"
    echo "# Anthropic API Key (added by Prompt Person Starter Kit)" >> "$SHELL_RC"
    echo "export ANTHROPIC_API_KEY=\"$API_KEY\"" >> "$SHELL_RC"
    echo -e "  ${DIM}Key saved to $SHELL_RC — it'll work automatically from now on${NC}"
  fi

  export ANTHROPIC_API_KEY="$API_KEY"
else
  echo -e "  ${DIM}No problem — you can add it later. You'll need Claude Pro or an API key to use your agent.${NC}"
fi

echo ""
echo -e "  ${YELLOW}Press Enter to continue...${NC}"
read

# -----------------------------------------------------------
# Step 3: Create workspace
# -----------------------------------------------------------
clear
echo ""
echo -e "${PURPLE}${BOLD}  STEP 3 of 4: Building your workspace${NC}"
echo -e "  ${DIM}Creating your agent's home on your computer...${NC}"
echo ""

WORKSPACE="$HOME/my-ai-agent"

if [ -d "$WORKSPACE" ]; then
  echo -e "  ${DIM}Workspace already exists — updating files.${NC}"
else
  mkdir -p "$WORKSPACE"
fi

mkdir -p "$WORKSPACE/.claude/memory"

sleep 0.3
echo -e "  ${GREEN}✓${NC} Created workspace folder"

# Write CLAUDE.md
cat > "$WORKSPACE/CLAUDE.md" << CLAUDEEOF
# My AI Assistant

You are ${USER_NAME}'s personal AI assistant. Your job is to help with: ${USER_GOALS}.

## About ${USER_NAME}
- Role: ${USER_ROLE}
- Primary needs: ${USER_GOALS}

## How to behave
- Be concise and direct
- Proactively suggest next steps
- Ask clarifying questions when a request is ambiguous
- Keep track of tasks and follow up on pending items
- When writing emails or messages, match a professional but friendly tone
- Remember important details about ${USER_NAME}'s work and preferences

## Tools available
You have access to the terminal, file system, and any MCP servers configured.
Use these tools to help ${USER_NAME} stay organized and productive.

## Memory
You have a persistent memory system at .claude/memory/. Read MEMORY.md for the index.
Save important information about ${USER_NAME} to memory so you remember it next time.
CLAUDEEOF

sleep 0.3
echo -e "  ${GREEN}✓${NC} Created agent personality (CLAUDE.md)"

# Write memory
cat > "$WORKSPACE/.claude/memory/MEMORY.md" << MEMEOF
# Memory Index

- [user_profile.md](user_profile.md) — Who ${USER_NAME} is and what they need help with
MEMEOF

cat > "$WORKSPACE/.claude/memory/user_profile.md" << PROFEOF
---
name: User Profile
description: ${USER_NAME}'s role, goals, and what the agent should help with
type: user
---

${USER_NAME} is a ${USER_ROLE}.
They want their AI agent to help with: ${USER_GOALS}.
PROFEOF

sleep 0.3
echo -e "  ${GREEN}✓${NC} Set up memory system"

# Copy templates and workflows
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -d "$SCRIPT_DIR/templates" ]; then
  cp -r "$SCRIPT_DIR/templates/"* "$WORKSPACE/" 2>/dev/null || true
fi
if [ -d "$SCRIPT_DIR/workflows" ]; then
  cp -r "$SCRIPT_DIR/workflows" "$WORKSPACE/" 2>/dev/null || true
fi
# Copy pro content if it exists
if [ -d "$SCRIPT_DIR/pro" ]; then
  cp -r "$SCRIPT_DIR/pro" "$WORKSPACE/" 2>/dev/null || true
  echo -e "  ${GREEN}✓${NC} Loaded Pro workflows, personas, and guides"
else
  echo -e "  ${GREEN}✓${NC} Loaded starter workflows"
fi

sleep 0.3
echo -e "  ${GREEN}✓${NC} Copied templates"

echo ""
echo -e "  ${GREEN}${BOLD}Workspace ready at: $WORKSPACE${NC}"
echo ""
echo -e "  ${YELLOW}Press Enter to continue...${NC}"
read

# -----------------------------------------------------------
# Step 4: Done!
# -----------------------------------------------------------
clear
echo ""
echo ""
echo -e "${GREEN}${BOLD}  ╔══════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}  ║                                          ║${NC}"
echo -e "${GREEN}${BOLD}  ║   YOU'RE ALL SET!                        ║${NC}"
echo -e "${GREEN}${BOLD}  ║                                          ║${NC}"
echo -e "${GREEN}${BOLD}  ║   Your AI assistant is ready to go.      ║${NC}"
echo -e "${GREEN}${BOLD}  ║                                          ║${NC}"
echo -e "${GREEN}${BOLD}  ╚══════════════════════════════════════════╝${NC}"
echo ""
echo ""
echo -e "  ${BOLD}To start your agent, just run:${NC}"
echo ""
echo -e "    ${PURPLE}${BOLD}cd ~/my-ai-agent && claude${NC}"
echo ""
echo ""
echo -e "  ${DIM}───── THINGS TO TRY ─────${NC}"
echo ""
echo -e "  ${BOLD}\"Draft an email to my team about tomorrow's meeting\"${NC}"
echo ""
echo -e "  ${BOLD}\"Create a task list for this week\"${NC}"
echo ""
echo -e "  ${BOLD}\"Research the top 5 competitors in my space\"${NC}"
echo ""
echo -e "  ${BOLD}\"Help me prep for my meeting with [name]\"${NC}"
echo ""
echo -e "  ${BOLD}\"Remember that my biggest client is [name]\"${NC}"
echo ""
echo ""
echo -e "  ${DIM}The more you use it, the smarter it gets.${NC}"
echo -e "  ${DIM}It remembers everything between conversations.${NC}"
echo ""
echo -e "  ${DIM}Need help? Book a call: promptperson.com/book-a-call${NC}"
echo -e "  ${DIM}Follow @prompt.person on TikTok for tips${NC}"
echo ""
echo ""
echo -e "  ${YELLOW}Press Enter to launch your agent now, or Ctrl+C to exit.${NC}"
read

cd "$WORKSPACE"
claude
