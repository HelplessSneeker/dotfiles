#!/bin/bash
# Sync Claude config from dotfiles repo

mkdir -p ~/.claude/agents

cp -r ./dotfiles/.claude/agents/*.md ~/.claude/agents/

# Future additions:
# mkdir -p ~/.claude/skills
# cp -r ~/dotfiles/.claude/skills/* ~/.claude/skills/
# cp ~/dotfiles/.claude/settings.json ~/.claude/settings.json

echo "Claude config synced."
